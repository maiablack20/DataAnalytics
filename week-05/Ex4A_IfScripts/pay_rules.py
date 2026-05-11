# Maia Black
# 2026-05-11

# Pay Rules assignment

# Calculate gross pay given the variables pay_rate and hours_worked. If the person works more than 40 hours, pay the overtime hours at 1.5 times the rate of regular hours.

pay_rate = 26.70
hours_worked = 50
regular_hours = 40

if hours_worked > 40:
    regular_pay = regular_hours * pay_rate
    overtime_hours = hours_worked - regular_hours
    overtime_pay = overtime_hours * pay_rate * 1.5 
    total_gross_pay = overtime_pay + regular_pay
    print("Total Gross Pay: ", total_gross_pay)
else:
    gross_pay = pay_rate * hours_worked
    print("Gross Pay Awarded: ", gross_pay)

# Results received are that total gross pay when hours worked are 50 is $1465.50

