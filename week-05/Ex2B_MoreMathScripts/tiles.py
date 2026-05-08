# Maia Black
# 2026-05-07

# You are going to tile a room whose dimensions are length by width feet. There are twelve tiles per box, each 1 foot by 1 foot. How many boxes of tiles do you need? You can only buy full boxes, not a partial box.

# How I understood the question: placing tile in a room and calculating the length and width. 

import math

length = float(input("Enter the legnth in feet: "))
width = float(input("Enter the width in feet: "))

Area = (length * width)

Boxes = math.ceil(Area/12)
print(Boxes)

# The amount boxes of tiles needed are 22. 