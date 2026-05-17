# Maia Black
# 2026-05-14
# Read and Write files

# Writing to a file 
with open("students.txt", "w") as file: 
    file.write("Alice\n")
    file.write("Bob\n")

# Reading from a file 
with open("students.txt", "r") as file: 
    content = file.read()
    print(content)

# Open file for reading 
with open("example.txt", "r") as file:
    content = file.read()
    print(content)

# Open file for writing 
with open('example.txt", "w"') as file:
    file.write("Hello, Python!")

# Append text to a file
with open ("example.txt", "a") as file: 
    file.write("\nNew line added.")

# Create a new file
with open("newfile.txt", "x") as file: 
    file.write("This file was created.")

# Read and write to the same file 
with open("example.txt", "x") as file:
    with open("example.txt", "r+") as file: 
        content = file.read()
        print(content)

        file.write("\nAdditional text.")