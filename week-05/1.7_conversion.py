# Maia Black
# 05/06/2026
# Calculating discounted price of an item

original_price = input("Enter the original price: 125.00")

discount_percentage = input("Enter the discount percentage: 5.00")

discounted_price = original_price * (1 - (discount_percentage/100))

print("The discounted price is: ", discounted_price)