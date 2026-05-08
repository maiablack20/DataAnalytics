# Maia Black 
# 2026-05-08

# How long will it take a savings account worth X to double in value based on an interest rate of IR? (Hint: Look up the “rule of 72”)

    # a) Figure out the formula and what the script would look like, making up example values as needed.

    # c) The displayed output should be formatted as follows: Your current savings is [number].At a [number]% interest rate, your savings account will be worth [number] in [number] years

current_savings = int(input("Enter the current savings: "))

annual_interest_rate = int(input("Enter the annual interest rate: "))

doubled_amount = (current_savings * 2)

years_doubled = round(72/annual_interest_rate,2)

print(f"Your current savings is: ${current_savings}. At a {annual_interest_rate}% interest rate, your savings account will be worth ${doubled_amount} in {years_doubled} years")