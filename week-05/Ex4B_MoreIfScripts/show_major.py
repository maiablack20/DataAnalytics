# Maia Black 
# 2026-05-12 

# Create a script that defines two vairables for a student: student_name and student_major. The student_major variable will contain a code for the student's major (e.g., ENG). 

student_name = input("Enter the student's name: ")
print("The student's name is: ", student_name)

major_code = input("Enter the student's major: ")
print("The major code is: ", major_code)

if major_code == "BIOL": 
    print("The Biology department's office is located in Science Bldg, Room 310")
elif major_code == "CSCI":
    print("The Computer Science department's office is located in Sheppard Hall, Room 314")
elif major_code == "ENG": 
    print("The English department's office is located in Kerr Hall, Room 201")
elif major_code == "HIST":
    print("The History department's office is located in Kerr Hall, Room 114")
elif major_code == "MKT":
    print("The Marketing department's office is located in Westly Hall, Room 310")
else: 
    print("<unknown>")

# The made up major code I included in my test run is POLSCI for Political science for a student named James Jones and it returned with the unknown value used within my else statement, which was as intended. This script works fine for known majors. However, it should be expanded for other majors as well if we're using it to inform students on where their major's department office is located. 