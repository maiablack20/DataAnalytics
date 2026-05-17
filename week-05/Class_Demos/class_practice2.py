# Maia Black
# 05/06/2026
# Creating a list w/ the names of three classmates

from tkinter.font import names


names = "Sharleen", "Vesna", "Leon"

list = [names]
print(f'The names of my three classmates are: {list}')

# Example 1:
list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(list1)

list2 = [1, 1.5, "ABC", True, [1,2,3]]
print(list2)

# Creating a dictionary with names of three classmates and the state they reside within

classmates = {"Hamzah": "New York", 
              "Ivana": "New Jersey", 
              "Kendra": "Maryland"}

print (f'Hamzah : {classmates["Hamzah"]}')
print (f'Ivana : {classmates["Ivana"]}')
print (f'Kendra : {classmates["Kendra"]}')