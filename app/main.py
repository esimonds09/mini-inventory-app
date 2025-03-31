import streamlit as st
import pyodbc
import os

from dotenv import load_dotenv


load_dotenv()

# Azure SQL connection config
server = os.getenv("AZURE_SQL_SERVER")
database = os.getenv("AZURE_SQL_DATABASE")
username = os.getenv("AZURE_SQL_USER")
password = os.getenv("AZURE_SQL_PASSWORD")

driver = "{ODBC Driver 17 for SQL Server}"
conn_str = f"DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}"

# Debug test - delete
st.write("Server: ", server)
st.write("Database: ", database)
st.write("User: ", username)
# Connect to the database
try: 
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
except Exception as e:
    st.error("Failed to connect to the database.")
    st.exception(e)
    st.stop()

st.title("Mini Inventory App")

# Add product type
st.subheader("Add Product Type")
new_type = st.text_input("Product Type Name")
if st.button("Add"):
    try:
        cursor.execute("INSERT INTO ProductTypes (TypeName) VALUES (?)", new_type)
        conn.commit()
        st.success(f"Added: {new_type}")
    except Exception as e:
        st.error("Failed to add product type. Maybe it already exists?")
        st.exception(e)

# List Product Types
st.subheader("Existing Product Types")
try:
    cursor.execute("SELECT * FROM ProductTypes")
    types = cursor.fetchall()
    if not types:
        st.info("No product types found.")
    for pt in types: 
        st.write(f"{pt.ProductTypeID}: {pt.TypeName}")
except Exception as e:
    st.error("Failed to fetch product types.")
    st.exception(e)
