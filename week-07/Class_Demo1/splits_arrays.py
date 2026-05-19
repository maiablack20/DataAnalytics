# Maia Black 
# 2026-05-18 
# 2D Array Split(axis = 0 -> rows) 

import numpy as np 

arr = np.array([[1, 2],
                [3, 4],
                [5, 6],
                [7, 8]])

result = np.split(arr, 2, axis = 0)
print(result)