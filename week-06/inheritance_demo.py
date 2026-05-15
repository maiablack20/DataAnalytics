# Maia Black
# 2026-05-14
# YearUp Academy - Student Roster using Inheritance

print()

# ----PARENT CLASS------------------------------------
class Student: 

    #Class attributes (shared by ALL students)
    school = "YearUp Academy"
    diploma = "High School Diploma"

    # Constructor - instance attributes unique to each student 
    def __init__(self, name, age, gpa):
        self.name = name
        self.age = age
        self.gpa = gpa
    
    # Shared method -- inherited by every child class
    def display_info(self):
        print(f"School: {Student.school}")
        print(f"Diploma: {Student.diploma}")
        print(f"Name: {self.name}")
        print(f"Age: {self.age}")
        print(f"GPA: {self.gpa}")

# --- CHILD CLASS 1 - App Dev ------------------------
class AppDev(Student):  # Inherits from student
    track = "Application Development" # class attribute (track-level)
    def __init__(self, name, age, gpa, language, project):
        super().__init__(name, age, gpa) # calls Student.__init__
        self.language = language # instance attribute
        self.project = project # instance attribute 

    def display_info(self): 
        super().display_info() # overrides parent display_info
        print(f"Track: {AppDev.Track}") # runs Student.display_info first
        print(f"Language: {self.language}")
        print(f"Project: {self.project}") 


# --- CHILD CLASS 1 - Data Analytics ------------------------
class DataAnalytics(Student): # also inherits from Student

    track = "Data Analytics"

    def __init__(self, name, age, gpa, tool, dataset):
        super().__init__(name, age, gpa)
        self.tool = tool # instance atttribute
        self.dataset = dataset # instance attribute

    def display_info(self): 
        super().display_info()
        print(f"Track: {DataAnalytics.track}")
        print(f"Tool: {self.tool}")
        print(f"Dataset: {self.dataset}")

# --- DISPLAY ALL STUDENT REPORTS --------------------
all_students = [student1, student2, student3, student4]

for student in all_students: 
    print("=" * 40)
    student.display_info()

print("=" * 40)

# --- ACCESS CLASS ATTRIBUTES DIRECTLY ---------------
print()
print(f"School: {Student.school}")
print(f"Diploma: {Student.diploma}")
print(f"Track 1: {AppDev.track}")
print(f"Track 2: {DataAnalytics.track}")

# --- CHECK INHERITANCE ------------------------------
print()
print(f"student1 is a Student? {isinstance(student1, Student)}")
print(f"student3 is a Student? {isinstance(student3, Student)}")
print(f"student1 is an AppDev? {isinstance(student1, AppDev)}")
print(f"student1 is a DataAnalytics? {isinstance(student1, DataAnalytics)}")