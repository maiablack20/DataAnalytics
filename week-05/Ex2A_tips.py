# Maia Black
# 2026-05-07
#Lab 1

# Define known values
food_cost = 79.25
tax = 6.54
tip = 12.00

# Calculate the unknown
total_due = food_cost + tax + tip

# Display the results
# print("The total due is " + str(total_due))

# 1.) The string function is being used to convert the total_due variable from a number to a string because the print function can only concatenate strings. If we tried to attempt this without the string function, then we would receive an error and the program would pause. 

# New Print Statement

print("Food cost is " + str(food_cost) + " and tax is " + str(tax))
# print("Tip is " + str(tip))
print("Total due is " + str(total_due))

print("Tip is " + format(tip, ".2f"))