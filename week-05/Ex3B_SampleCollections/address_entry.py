# Maia Black
# 2026-05-11

# Address Entry Exercise

# Create a file named address_entry.py, and in it define a dictionary named contact_info that includes the following keys and the sample values of your choice:
# name
# address
# city
# state
# zip

contact_info ={
"name": "Noemie Harris",
"address": "1234 Michael Soft Way",
"city": "Averageville",
"state": "Kentucky",
"zip": "67890"}
print(contact_info)

# Print the address as properly formatted for mailing. Avoid using multiple print statements. Experiment with using a multi-line f-string (triple quotes), or use "\n" (new line) to break the address into multiple lines. 

print(f"Customer's Mailing Address: {contact_info['name']} \n {contact_info['address']} \n {contact_info['city']}, {contact_info['state']}, {contact_info['zip']}")

# Remove the key:value pair for name

del contact_info['name']
print(contact_info)

# Add a new variable for full_name and assign its value as a dictionary containing two key:value pairs. The first key:value pair should contain the key “first name” and a first name, and the second should contain the key “last name” and a last name.

full_name ={
    "first name": "Noemie",
    "last name": "Harris"
}
print("Customer's full name: ", full_name['first name'], full_name['last name'])

# Use the .update() method to add one more key:value pair to full_name, with the key“honorific” and the value set to Mr. / Ms. / Mx. / Dr. / Hon. / etc. as appropriate.

full_name.update({"honorific":"Dr."})
print(full_name)

# Use the .update() method to add full_name to contact_info

contact_info.update(full_name)
print(contact_info)

# Print the formatted address again, updating as needed to include the new dictionary items.

print(f" Customer's Mailing Address: {contact_info['honorific']} {contact_info['first name']} {contact_info['last name']} \n {contact_info['address']} \n {contact_info['city']}, {contact_info['state']}, {contact_info['zip']}")