# Maia Black 
# 05/06/2026
# Total cost of a meal


cost = float(input("Enter the cost of the meal: "))
tip = float(input("Enter the tip percentage: "))
tax = float(input("Enter the tax percentage: "))

total_cost = cost + (cost * tip / 100) + (cost * tax / 100)
print("The total cost of the meal is: $", round(total_cost, 2))