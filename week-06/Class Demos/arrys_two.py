# Maia Black 
# 2026-05-15
# Array Attributes

import Numpy as np 

# =================================================
# 1D ARRAY (One-Dimensional Array)
# ===========================================
# A 1D Array is like a simple list of elements. 

arr_id = np.array([10, 20, 30, 40, 50])

print("=== 1D Array ===")
print(arr_id) 

# Accessing elements in 1D array usin index 
print("First element: ", arr_id[0]) # index 0 
print("Third element: ", arr_id[2]) # index 2
print("Last element: ", arr_id[-1]) # negative indexing (last item)

print("\n")