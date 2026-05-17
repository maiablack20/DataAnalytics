# Maia Black 
# 2026-05-15

# Displaying Mailing Label Exercise 

# First Function: 
def display_mailing_label(name, address, city, state, zip):
    print(f"=====================================")
    print(f"{name}")
    print(f"{address}")
    print(f"{city}, {state} {zip}")

display_mailing_label(f"Virgil Hawkins", "2234 Electric Way", "Dakota", "Illinois", "23445")
display_mailing_label(f"Kiyomi Simmons", "2523 Walnut Crest Lane", "Houston", "Texas", "77001")
display_mailing_label(f"Seraphina Williams", "2400 Sun Crest Way", "Atlanta", "Georgia", "30033")

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
def display_receipt(total_due, amount_paid):
    print(f"Total Due: ${total_due:.2f}")
    print(f"Amount Paid: ${amount_paid:.2f}")
    if total_due > amount_paid: 
        remaining_balance = total_due - amount_paid
        print(f"Remaining Balance: ${remaining_balance:.2f}")
        print(f"=====================================")
    elif amount_paid == total_due:
        print(f"Transaction Approved")
        print(f"=====================================")
    else: 
        change_due = amount_paid - total_due
        print(f"Change Due: ${change_due:.2f}")
        print(f"=====================================")

display_receipt(20.50, 109.50)
display_receipt(13.50, 13.50)
display_receipt(24.30, 25.00)