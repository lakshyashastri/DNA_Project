# ***PROJECT ONLINE***
***
## A project developed for the course **Data And Applications**, by Team 50
***
### **Team Members**
- *Lakshya Shastri* 
- *Harshit Karwal*
- *Adnan Qidwai*
***

## **Project Description**

This project is a Python-MySQL based Database application. The database primarily serves to keep track of ongoings in Los Santos and to know the back-and-front of every person Lester is working with. It helps to make everything convenient to use and makes it much more secure as compared to other modes of operations. The Miniworld for the project was first designed in Phase-1 of the project and later, converted in a relational data model, which was then normalized till 3NF and finally implemented in MySQL.

We create an application which makes use of the most frequent and broad-based queries that are used in the database. The application is a command line interface which is easy to use and understand. The application is made in Python and uses PyMySQL interface for the connection. We list these queries as:

## **Retrieval**
### Selection
1) Retrieve the names of all the close associates
2) Retrieve information of all the properties
3) Retrieve information of all the criminal organisations

### Projection
4) Retrieve data on a close associate with specified special skill. Input: `<Special skill>`
5) Retrieve all the weapons which cost more than the specified amount. Input: `<Weapon cost>`
6) Retrieve the BAWSAQ Index of all business of specified type. Input: `<Business type>`

### Aggregation
7) Retrieve average cost of a weapon type. Input: `<Weapon type>`
8) Retrieve the total number of people who are a part of a criminal organisation
9) Retrieve the cheapest weapon from specified weapon type. Input: `<Weapon type>`

### Search
10) Search for a business with specified BAWSAQ Index. Input: `<BAWSAQ Index>`
11) Search for complete information of a weapon with specified keyword in their name. Input: `<Keyword>`
12) Search for all criminal organisations which start with the specified letter combination. Input: `<letter combination>`

### Analysis
13) Search for all weapons which a close associate with specified special skill uses. Input: `<Special skill>`
14) Retrieve all the information of adversaries with weapons that cost more than the specified amount. Input: `<Weapon cost>`
15) Retrieve major locations of landmark events which involved criminal organisations with more than the specified number of members. Input: `<Number of members>`

## **Modification**

### Insertion
16) Insert a new weapon. Input: `<Weapon name>`, `<Type>`, `<Cost>`
17) Insert a new vehicle. Input: `<Model>`, `<Manafacturer>`, `<Maximum speed>`, `<Vehicle type>`

### Updation
18) Update status of Adversary. Input: `<New status>`, `<Adversary name>`
19) Update cost of weapon. Input: `<Weapon cost>`, `<Name>`
20) Update address of close associate. Input: `<House number>`, `<Street>`, `<Neighbourhood>`, `<City>`, `<County>`

### Deletion
21) Delete a business from the database. Input: `<Business name>`
22) Delete a property from the database. Input: `<Property ID>`

## **Miscellaneous**
23) Show all the tables
24) Show the entire contents of the specified table. Input: `<Table name>`
25) Logout

The above queries will be displayed on the terminal.
In the queries which have an input prompt, the user will be asked for an input along with a prompt. The user can enter the input and the query will be executed. The output will be displayed on the terminal.

## ***Clarifications***
- The `Valuation` column in the `Business` table is measured in millions of dollars. For example, if the value is 3, it means that the business is worth 3 million dollars.
- We did not use any external libraries to tabulate the results of the tables as mentioned in the project instructions page on GitHub.
- Properties include things like vehicle storages, mansions, and apartments. Everything else like Hotels, Clothing stores, Gyms, and Bars are included under Businesses.
- Landmark events correspond to significant in-game missions.
