import pymysql
import pymysql.cursors

# removing collaborate_with 
tables = [
    "Weapon",
    "Wield_weapon",
    "Weapon_supported_attachments",
    "Weapon_customisation_set",
    "Adversary_wield",
    "Bulk_purchase",
    "Criminal_organisation",
    "Event_involves",
    "Hires",
    "Adversary",
    "Business",
    "Vehicle",
    "Drive",
    "Close_associate",
    "Collaborate_with",
    "Consort",
    "Address",
    "Landmark_event",
    "Property"
]

def setup(con: pymysql.connections.Connection):
    pass
