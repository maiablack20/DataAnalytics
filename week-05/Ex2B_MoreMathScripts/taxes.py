# Maia Black
# 2026-05-07
# Calculating Taxes 

# Federal taxes are 23% of your salary every month. You make X amount of money.How much is withheld for taxes?

federal_taxes = 23

monthly_salary = float(input("Enter the Monthly Salary: "))

withheld = monthly_salary * federal_taxes/100
print("The total amount withheld for taxes is: $",round(withheld,2))

    # The total amount withheld $1150.00