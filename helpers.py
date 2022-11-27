from queries import query_list

def display_options(queries = query_list, logout = 1):
    for index, query in enumerate(queries, start = 1):
        print(f"{index}) {query.description}")
    
    if logout:
        print(f"{len(query_list)}) Logout")
    print()

def dispatch(choice):
    """
    Function that maps option entered to helper functions
    """

    if not 1 <= choice <= len(query_list) + 1:
        pass
    query = query_list[choice]
