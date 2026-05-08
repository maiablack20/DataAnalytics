# Maia Black
# 2026-05-07

# Net Worth Calculation

# 1. How do you calculate your net worth given your assets and debts?

    #a) Start by brainstorming: What are “assets” that would need to be included in this calculation? What about “debts”?


assets = (int(input("Enter the total assets: ")))

debts = (int(input("Enter the total debt: ")))

net_worth = (assets - debts) 
print("Total Net Worth: $ ", round(net_worth,2))

# The total net worth calculated is $20,000