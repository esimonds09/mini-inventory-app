import streamlit as st
import pyodbc

# Connect to Azure SQL
conn = pyodbc.connect("DRIVER={ODBC Driver 17 for SQL Server};SERVER=...;DATABASE=...;UID=...;PWD=...")
cursor = conn.cursor()

st.title("Mini Inventory App")

st.header("Add Product Type")
new_type = st.text_input("Type Name")
if st.button("Add"):
    cursor.execute("INSERT INTO ProductTypes (TypeName) VALUES (?)", new_type)
    conn.commit()
    st.success(f"Added: {new_type}")

st.header("Existing Product Types")
cursor.execute("SELECT * FROM ProductTypes")
rows = cursor.fetchall()
for row in rows: 
    st.write(f"{row.ProductTypeID}: {row.TypeName}")
    