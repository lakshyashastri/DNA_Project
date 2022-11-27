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

This project is a Python-MySQL based Database application. The database primarily serves to keep track of ongoings in Los Santos and to know the backand-front of every person Lester is working with. It helps to make everything convenient to use and makes it much more secure as compared to other modes of operations. The database schema was first designed in the first phase of the project and later, converted in a relational data model, which was then normalized till 3NF and finally implemented in MySQL.

We create an application which makes use of the most frequent and broad-based queries that are used in the database. The application is a command line interface which is easy to use and understand. The application is made in Python and uses PyMySQL interface for the connection. We list these queries as:

1) Retrieve the names of all close associates

2) Retrieve complete data tuples of all properties
3) Retrieve complete data tuples of all criminal organisations
4) Complete data tuple of a close associate with `<input>` as their special skill
5) Names of all weapons which cost more than `<input>`
6) BAWSAQ stock index of all business which have the type `<input>`
7) Average cost of all weapons of the type `<input>`
8) Retrieve total number of criminals in Los Santos who are in a criminal organisation
9) Minimum cost of a weapon of the type `<input>`
10) Businesses with `<ipnut>` somewhere in their stock index
11) Complete data tuple of all weapons with `<input>` in their name
12) Names of all criminal organisations starting with `<input>`
13) Name of weapons that an associate with special skill `<input>` wields
14) Complete data tuple of adversaries with weapons that cost more than `<input>`
15) Major location of landmark events which involved criminal organisations with more
than `<input>` members

The above queries will be displayed on the terminal.
In each of these queries which have an input prompt, the user will be asked for an input along with a prompt. The user can enter the input and the query will be executed. The output will be displayed on the terminal.