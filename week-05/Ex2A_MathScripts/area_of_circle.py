# Maia Black
# 2026-05-08

# Calculating the area of a circle

# 4. How do you calculate the area of a circle?
    
# a) The diameter of a given circle is the same as the day of your birthday (not the month,just the day). Figure out the formula, refresh your recollection of the difference between diameter and radius, and figure out what the script should look like.

import math

diameter = 20 

radius = int((diameter/2))

area = (math.pi * radius**2)
print(f"The area of a circle with a radius of {radius}  is: {area:.2f}")

# The area of a circle with a radius of 10 is 314.16.