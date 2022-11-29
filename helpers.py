from queries import query_list
# from tabulate import tabulate

def display_options(queries = query_list, logout = 1):
    for index, query in enumerate(queries, start = 1):
        print(f"{index}) {query.description}")
    
    if logout:
        print(f"{len(query_list) + 1}) Logout")
    print()

def dispatch(choice, con, cur):
    """
    Function that maps option entered to helper functions
    """

    if not 1 <= choice <= len(query_list) + 2:
        print("Invalid choice")
        return

    elif choice == len(query_list) + 1:
        exit()
    
    else:
        query = query_list[choice - 1]

        # set query inputs
        if query.input_args_descs:
            for input_arg_desc in query.input_args_descs:
                inp = input(f"Enter the {input_arg_desc.lower()}: ")
                query.exec_args.append(int(inp) if inp.isdigit() else inp)
        
        # execute query
        try:
            if query.query.startswith("SELECT") and query.query.split("WHERE")[0].count(r"%s"): # format specifiers don't work with SELECT: check if they're used with SELECT
                cur.execute(query.query.replace(r"%s", str(query.exec_args[0])))
            else:
                cur.execute(*query.format())
                con.commit()
        except Exception as e:
            print(e)
            con.rollback()
            return

        # get data
        columns = cur.description
        result = cur.fetchall()
        if columns is not None:
            SEP = f"======================="
            SEP += "=" * ((len(columns) - 1) * 35)

        # return if no results if read query
        if columns and not result:
            print("No results found")
            return

        # format and print column names
        if columns is not None:
            columns = [col[0] for col in columns]
            print(SEP)
            for col in columns:
                print("{:<35}".format(str(col)), end = "")
            print(f"\n{SEP}")

            # print data
            for data_tuple in result:
                for data in data_tuple:
                    print("{:<35}".format(str(data)), end = "") # str(data) for NULL values
                print()
            print(f"{SEP}")
