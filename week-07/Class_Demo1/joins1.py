# Maia Black 
# 2026-05-18 
# 2D array 

import numpy as np 

arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])

arr3 = np.concatenate((arr1, arr2))
print(arr3)

# Joining 2 2D array with axis = 0 
arrA = np.array([[1, 2], 
                 [3, 4]])

arrB = np.array([[5,6], [7, 8]])

# join horizontally (column-wise)
result2 = np.concatenate((arrA, arrB), axis = 1)
print(result2)