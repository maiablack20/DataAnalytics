# Maia Black
# 2026-05-14 

# Employee Directory System Exercise

print()
class Employee: 
    company = "DataPulse Analytics"

    def __init__(self, name, department, salary):
        self.name = name
        self.department = department
        self.salary = salary
    def display_info(self):
        print(f"Company: {Employee.company}")
        print(f"Name: {self.name}")
        print(f"Department: {self.department}")
        print(f"Salary: {self.salary:,.2f}")
        print("-----------------------------")
    def annual_bonus(self):
        bonus = self.salaru * 0.10
        print("Annual bonus for {self.name}: ${bonus:,.2f}")
