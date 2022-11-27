# All queries stored in this class
class Query:
    def __init__(self, query, description, argc, input_args):
        self.query = query
        self.description = description
        self.argc = argc
        self.input_args = input_args

    """
    Returns exactly what you can pass to cur.execute()
    """
    def format(self, *args):
        if len(args) != self.argc:
            print(f"Query needs exactly {self.argc} arguments, {len(args)} provided")
            exit(0)
        return (self.query, args)

# All actual query data
# Query data is of the form (QUERY, DESCRIPTION, (Attribute1, Attribute2, ...))
queries = [
    # retrieval queries
    [
        # selection
        [
            
        ],

        # projection
        [

        ],

        # aggregate
        [

        ],

        # search
        [

        ],

        # analysis
        [

        ]
    ],

    # modification queries
    [
        # insertion
        [
            ('INSERT INTO Weapon VALUES (%s, %s, %d)', "Insert a new weapon", ("Weapon name", "Type", "Cost")),
            ('INSERT INTO Vehicle VALUES (%s, %s, %d, %s)', "Insert a new vehicle", ("Model", "Manafacturer", "Maximum speed", "Vehicle type")),
        ], 

        # updation
        [
            ('UPDATE Adversary SET Status=%s WHERE Name=%s', "Update status of Adversary", ("New status", "Adversary name")),
            ('UPDATE Weapon SET Cost=%d WHERE Name=%s', "Update cost of weapon", ("Weapon cost", "Name")),
            ('UPDATE Address SET Address.House_number=%d, Address.Street=%s, Address.Neighbourhood=%s, Address.City=%s, Address.County=%s WHERE Address.Address_id=Close_associate.Address_id FROM Close_associate, Address', "Update address of close associate", ("House number", "Street", "Neighbourhood", "City", "County"))
        ],

        # deletion
        [
            ('DELETE FROM Business WHERE Name=%s', "Delete a business from the database", ("Business name", )),
            ('DELETE FROM Property WHERE Property_id=%d', "Delete a property from the database", ("Property ID", ))
        ]
    ]
]

# generate list of queries
specifiers = (r"%s", r"%d", r"%f")
query_list = []
for type in queries[0] + queries[1]:
    for query in type:
        query_list.append(Query(query[0], query[1], sum(query[0].count(specifier) for specifier in specifiers), query[2]))
