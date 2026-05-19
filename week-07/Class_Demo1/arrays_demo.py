# Maia Black
# 2026-05-18

import numpy as np

print("=== NumPy Array Creation Functions ===\n")

# 1. array() - create from Python list 
a = np.array([1, 2, 3, 4, 5])
print("np.array([1, 2, 3, 4, 5])")
print(a, "\n")

# 2 zeros() - array of zeros 
b = np.zeros((2,3))
print("np.zeros((2,3))")
print(b, "\n")

# 3. ones() - array of ones 
c = np.ones((2,2))
print("np.ones((2,2))")
print(c, "\n")

# 4. full() - array filled with a constant value 
d = np.full((3,2), 7)
print("np.full((3,2)7)")
print(d, "\n")

# Array Attributes: 

# Create a 2D NumPy array 
a = np.array([[10, 20, 30],
              [40, 50, 60]])
print("Array: ")
print(a)

# .shape -> dimensions (rows, columns)
print("\nShape of array: ", a.shape)

# .ndim -> number of dimensions 
print("Number of dimensions (ndim): ", a.ndim)

# .dtype -> data type of elements
print("Data Type (dtype): ",a.dtype)

# .size -> total number of elements 
print("Total number of elements(size): ", a.size)

# Loop Through 1D:

arr1d = np.array([10, 20, 30, 40])

# Loop through each element directly 
for x in arr1d:
    print(x)

# Loop through 2D: 
arr2d = np.array([[1, 2, 3], 
                 [4, 5, 6]])
for row in arr2d: 
        for value in row: 
            print(value)

# First loop -> gets rows 
# Second loop -> gets elements inside each row

# Creating a 2D array 

arrA = np.array([[11, 12, 13], 
                 [14, 15, 16]])
print(arrA)
for x in arrA: 
        print(x * 2)
for y in x: 
        loop_result = y * 2
        print(loop_result)