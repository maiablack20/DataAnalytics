# Maia Black 
# 2026-05-15

# Displaying Mailing Label Exercise 

# First Function: 
def display_mailing_label(name, address, city, state, zip, address2 = None):
    print(f"=====================================")
    print(f"{name}")
    print(f"{address}")
    if address2 is not None: 
            print(f"{address2}")
    print(f"{city}, {state} {zip}")

display_mailing_label(f"Virgil Hawkins", "2234 Electric Way", "Dakota", "Illinois", "23445")
display_mailing_label(f"Kiyomi Simmons", "2523 Walnut Crest Lane", "Houston", "Texas", "77001")
display_mailing_label(f"Seraphina Williams", "2400 Sun Crest Way", "Atlanta", "Georgia", "30033")

#BONUS: 
display_mailing_label(f"Brandy Morton", "2300 South Fannie Lou Hamer Boulevard", "Atlanta", "Georgia", "30301", address2 = "Apt.F246")

# Second Function: 
def add_numbers(*numbers):
    equation = ""
    for n in numbers:
        equation += str(n) + " + "



    equation = equation.rstrip(" + ")
    n1 = sum(numbers)
    print(f"=====================================")
    print(f"{equation} = {n1}")
    print(f"=====================================")
add_numbers(12, 30, 40)
add_numbers(22, 99, 200)
add_numbers(1, 79, 350)


# Third Function
def display_receipt(*total_due, amount_paid):
    totals = sum(total_due)
    print(f"Totals: ${totals:.2f}")
    print(f"Amount Paid: ${amount_paid:.2f}")
    if totals > amount_paid: 
        remaining_balance = totals - amount_paid
        print(f"Remaining Balance: ${remaining_balance:.2f}")
        print(f"=====================================")
    elif amount_paid == totals:
        print(f"Transaction Approved")
        print(f"=====================================")
    else: 
        change_due = amount_paid - totals
        print(f"Change Due: ${change_due:.2f}")
        print(f"=====================================")

display_receipt(20.50, amount_paid = 109.50)
display_receipt(13.50, amount_paid = 13.50)
display_receipt(24.30, amount_paid = 25.00)

# BONUS: 
display_receipt(40.00, 32.00, amount_paid = 3.00)