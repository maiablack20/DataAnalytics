# Maia Black 
# 2026-05-11

# Complex Taxes Calculation 

# Start by copying your code for calculation of gross pay from the earlier lab (pay_rules.py) and include it here as part of your starting point. Remember, that code calculates weekly gross pay. Extend that calculation to estimate annual gross pay (how many weeks in a year?) and save it to a new variable

pay_rate = 50.00
regular_hours = 80

hours_worked = int(input("Enter the number of hours worked: "))
print("You worked", hours_worked, "hours this period." )

filing_status = (input("Enter your filing status: "))
print("Your filing status is: ", filing_status)

if hours_worked > 40:
    regular_pay = regular_hours * pay_rate
    overtime_hours = hours_worked - regular_hours
    overtime_pay = overtime_hours * pay_rate * 1.5 
    total_gross_pay = overtime_pay + regular_pay
    print(f"Because you earn ${pay_rate:.2f}, per hour, your gross weekly pay is", total_gross_pay)

    annual_gross_pay = total_gross_pay * 52
    print("Annual Gross Pay: ", annual_gross_pay)

else:
    total_gross_pay = pay_rate * hours_worked
    print(f"Because you earn {pay_rate:.2f} per hour, your gross weekly pay is", total_gross_pay)

    annual_gross_pay = total_gross_pay * 52
    print("Annual Gross Pay for Non-Overtime Employees: ", annual_gross_pay)

if filing_status == "single" and annual_gross_pay < 12000:
        tax_rate = 0.05
elif filing_status == "joint" and annual_gross_pay < 12000:
      tax_rate = 0.00
elif filing_status == "single" and annual_gross_pay >= 12000 and annual_gross_pay <= 24999.99:
        tax_rate = 0.10
elif filing_status == "joint" and annual_gross_pay>= 12000 and annual_gross_pay <= 24999.99:
        tax_rate = 0.06
elif filing_status == "single" and annual_gross_pay >= 25000 and annual_gross_pay <= 74999.99:
      tax_rate = 0.15
elif filing_status == "joint" and annual_gross_pay >= 25000 and annual_gross_pay <= 74999.99:
      tax_rate = 0.11
elif filing_status == "single" and annual_gross_pay >= 75000:
      tax_rate = 0.20
elif filing_status == "joint" and annual_gross_pay >= 75000:
      tax_rate = 0.20

tax_withholding = annual_gross_pay * tax_rate
print("Your tax withholding for the week is: $", tax_withholding)

net_pay = annual_gross_pay - tax_withholding
print("Your net pay is: $", net_pay)

# Each test ran with the values I came up with such as 80 hours with a pay rate of $50, 24 hours with a pay rate of $12.60, 30 hours with a pay rate of $13.00, and 40 hours with a pay rate of $22.00 provided different results when I used a mix of joint filing and single filing for each. What I noticed is that depending on how you filed, your income was much more different, whether you are doing joint filing or single filing. 

# The values produced from each were good on their own and there were no issues when it came to running the tests on all four of them. 