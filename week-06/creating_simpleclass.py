# Maia Black
# 2026-05-13
# Define a Python Class

class Student:
    # Constructor method 
    def __init__(self, name, grade): 
              self.name = name 
              self.grade = grade

    # Method to display student information
    def display_info(self): 
           print(f" Student: Name: {self.name}")
           print(f"Grade: {self.grade}")
           print("-------------------")

# Create 2 student objects 
student1 = Student("Alice", 95) 
student2 = Student("Brian", 88)

# Display the student objects using f-strings 
print(f"Student 1: {student1.name} {student1.grade}")
print(f"Student 2: {student2.name} {student2.grade}")

# Call the method for each student 
student1.display_info()
student2.display_info()