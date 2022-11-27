import subprocess as sp
import pymysql
import pymysql.cursors
from os import getenv

from options import *
from setup import *
from helpers import display_options, dispatch

while (1):
    sp.call('clear', shell=True)

    # Connect to DB
    try:
        con = pymysql.connect(host='localhost', user="lakshya", password=getenv('PP4_PW'))
    except Exception as e:
        sp.call('clear', shell=True)
        print(e)
        input("Press any key to continue> ")
        sp.call('clear', shell=True)

    # check if connection is valid
    if (con.open):
        print("Connected")
    else:
        print("Failed to connect")
    
    # setup cursor
    input("Press any key to continue> ")
    cur = con.cursor()
    setup(con)

    # run
    while (1):
        sp.call('clear', shell=True)
        display_options()

        choice = int(input("\nEnter choice> "))
        dispatch(choice)
        input("Press any key to continue> ")
