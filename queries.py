# All queries stored in this class
class Query:
    def __init__(self, query, description, argc, input_args_descs, exec_args = None):
        if exec_args is None:
            exec_args = []

        self.query = query
        self.description = description
        self.argc = argc
        self.input_args_descs = input_args_descs
        self.exec_args = exec_args

    """
    Returns exactly what you can pass to cur.execute()
    """
    def format(self, *args):
        args = self.exec_args
        if not args:
            return (self.query, ())

        if len(args) != self.argc:
            print(f"Query needs exactly {self.argc} arguments, {len(args)} provided")
            exit(0)
        return (self.query, tuple(args))

# All actual query data
# Query data is of the form (QUERY, DESCRIPTION, (Attribute1, Attribute2, ...))
queries = [
    # retrieval queries
    [
        # selection
        [
            ('SELECT Name FROM Close_associate', "Retrieve the names of all the close associates", ()),
            ('SELECT * FROM Property JOIN Address ON Property.Address_id=Address.Address_id', "Retrieve information of all the properties", ()),
            ('SELECT * FROM Criminal_organisation', "Retrieve information of all the criminal organisations", ())
        ],

        # projection
        [
            ('SELECT * FROM Close_associate JOIN Address ON Close_associate.Address_id=Address.Address_id WHERE Close_Associate.Special_skill=%s', "Retrieve data on a close associate with specified special skill", ("Special skill", )),
            ('SELECT Name FROM Weapon WHERE Cost>%s', "Retrieve all the weapons which cost more than the specified amount", ("Weapon cost", )),
            ('SELECT BAWSAQ_Index FROM Business WHERE Type=%s', "Retrieve the BAWSAQ Index of all business of specified type", ("Business type", ))
        ],

        # aggregate
        [
            ('SELECT AVG(Cost) AS Average FROM Weapon WHERE Type=%s', "Retrieve average cost of a weapon type", ("Weapon type", )),
            ('SELECT SUM(Member_count) AS Total_criminals FROM Criminal_organisation', "Retrieve the total number of people who are a part of a criminal organisation", ()),
            ('SELECT MIN(Cost) AS Cheapest FROM Weapon WHERE Type=%s', "Retrieve the cheapest weapon from specified weapon type", ("Weapon type", ))
        ],

        # search
        [
            ("SELECT Name FROM Business WHERE BAWSAQ_Index LIKE CONCAT('%%', %s, '%%')", "Search for a business with specified BAWSAQ Index", ("BAWSAQ Index", )),
            ("SELECT * FROM Weapon WHERE Name LIKE CONCAT('%%', %s, '%%')", "Search for complete information of a weapon with specified keyword in their name", ("Keyword", )),
            ("SELECT Name FROM Criminal_organisation WHERE Name LIKE CONCAT('%%', %s, '%%')", "Search for all criminal organisations which start with the specified letter combination", ("Letter combination", ))
        ],

        # analysis
        [
            ('SELECT Wield_weapon.Weapon_name FROM Wield_weapon JOIN Close_associate ON Wield_weapon.Owner_name=Close_associate.Name WHERE Close_associate.Special_skill=%s', "Search for all weapons which a close associate with specified special skill uses", ("Special skill", )),
            ('SELECT * FROM Adversary WHERE Name IN (SELECT Adversary_wield.Adversary_name FROM Adversary_wield JOIN Weapon ON Adversary_wield.Weapon_name=Weapon.Name WHERE Weapon.Cost>%s)', "Retrieve all the information of adversaries with weapons that cost more than the specified amount", ("Weapon cost", )),
            ('SELECT Landmark_event.Major_location FROM Landmark_event WHERE Serial_number IN (SELECT Event_involves.Event_number FROM Event_involves JOIN Criminal_organisation ON Event_involves.Organisation_name=Criminal_organisation.Name WHERE Criminal_organisation.Member_count>%s)', "Retrieve major locations of landmark events which involved criminal organisations with more than the specified number of members", ("Number of members", ))
        ]
    ],

    # modification queries
    [
        # insertion
        [
            ('INSERT INTO Weapon VALUES (%s, %s, %s)', "Insert a new weapon", ("Weapon name", "Type", "Cost")),
            ('INSERT INTO Vehicle VALUES (%s, %s, %s, %s)', "Insert a new vehicle", ("Model", "Manafacturer", "Maximum speed", "Vehicle type")),
        ], 

        # updation
        [
            ('UPDATE Adversary SET Status=%s WHERE Name=%s', "Update status of Adversary", ("New status", "Adversary name")),
            ('UPDATE Weapon SET Cost=%s WHERE Name=%s', "Update cost of weapon", ("Weapon cost", "Name")),
            ('UPDATE Address SET Address.House_number=%s, Address.Street=%s, Address.Neighbourhood=%s, Address.City=%s, Address.County=%s WHERE Address.Address_id=Close_associate.Address_id FROM Close_associate, Address', "Update address of close associate", ("House number", "Street", "Neighbourhood", "City", "County"))
        ],

        # deletion
        [
            ('DELETE FROM Business WHERE Name=%s', "Delete a business from the database", ("Business name", )),
            ('DELETE FROM Property WHERE Property_id=%s', "Delete a property from the database", ("Property ID", ))
        ]
    ],

    # misc queries
    [
        [
            ('SHOW TABLES', "Show all the tables", ()),
            ('SELECT * FROM %s', "Show table", ("Table Name", ))
        ]
    ] 
]

# generate list of queries
specifiers = (r"%s", r"%d", r"%f")
query_list = []
for query_cat in queries:
    for type in query_cat:
        for query in type:
            query_list.append(Query(query[0], query[1], sum(query[0].count(specifier) for specifier in specifiers), query[2]))
