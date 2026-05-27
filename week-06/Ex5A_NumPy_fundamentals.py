# Maia Black
# 2026-05-27
# Working with the fundamentals of NumPy, which will include the basics of arrays and will be a sort of review for me as well. I chose to work with VS Code in a python script rather than using Jupyter Notebook itself or in VS Code because I was experiencing issues with importing NumPy. 

# Array Basics

import numpy as np

# arr_1: 
fruits = ["apple", "banana", "cherry", "date"]
arr_1 = np.array(fruits)
print(arr_1)

# Finding the data type of arr_1
print(arr_1.dtype)
# The data type for this array would be U6. The "U" in U6 stands for Unicode, which is what Python uses to represent text/string data. As for the "6" in U6, this stands for the maximum length of characters within the data type, which has been contributed by the words "banana" and "cherry". 


# arr_2:
numbers = [(10, 11, 12),
         (13, 14, 15)]
arr_2 = np.array(numbers)

# transposing arr_2: 
print(arr_2.T)
print(arr_2)
# Transposing does not change the original values themselves, but moreso the positioning of them. When using "arr_2.T", you get the original data reordered in a way where all variables are in numerical order, but with 10, 11, and 12 on the left and 13, 14, and 15 on the right side. 

# arr_3: 
num1 = [(1, 3, 5),
        (2, 4, 6)]
arr_3 = np.array(num1)
print(arr_3)

# arr_4: 
arr_4 = np.array([arr_3[0, 2], arr_3[1, 1]])
print(arr_4)
    # 5 is what is located at row 0, column 2 while 4 is located at row 1, column 1. 

# arr_5: 
arr_5 = np.ones((2, 2, 2))
print(arr_5)