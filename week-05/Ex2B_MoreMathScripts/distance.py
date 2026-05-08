# Maia Black 
# 2026-05-07 
# Calculating the distance

# How do you calculate the distance between coordinates (x1, y1) and (x2, y2)? Hint: You'll need to look up how to calculate a square root in Python, which may involve a function from the math module.

# coordinates = (x1, y1), (x2, y2)

import math

x1 = float(input("Enter the x1: "))
x2 = float(input("Enter the x2: "))
y1 = float(input("Enter the y1: "))
y2 = float(input("Enter the y2: "))

distance = math.sqrt((x2-x1)**2 + (y2-y1)**2)
print(round(distance,2))

    # The results that I received from my calculations is 2.24. 