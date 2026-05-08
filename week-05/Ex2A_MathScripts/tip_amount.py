# Maia Black 
# 2026-05-07

# Calculating the tip amount

# 3. How do you calculate the tip amount on a restaurant bill given the tip percentage?
    
    # a) Figure out the formula and what the script would look like, making up example values as needed. (If you need inspiration, what was your approximate restaurant bill the last time you ate at a restaurant?)

tip = int(input("Enter the tip percentage: "))
cost = int(input("Enter the cost: "))

tip_amount = (cost * tip)/100
print(f"Tip Amount is: ${tip_amount:.2f}")

# The results of this script after using 20 for the tip percentage and then $50 for the meal cost, my tip amount came to be $10.00. 