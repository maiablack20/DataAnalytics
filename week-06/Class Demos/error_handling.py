# Maia Black
# 2026-05-15
# Read and write files

# Examples of try, except, else, and final in Python

try: 
    # Ask the user for a number
    number = int(input("enter a number: "))
    # Divide 100 by the number 
    result = 100/number

except ValueError:
    # Runs if the user enters non-numeric data 
    print("Error: Please enter a valid number: ") 

except ZeroDivisionError: 
    # runs if the user enters 0 
    print("Error: Cannot divide by zero.")

else: 
    # Runs only if no errors occur
    print(f"The result is: {result}")

finally: 
    # Always runs whether an error occurs or not 
    print("Program execution completed.")

# Error Handling 
try: 
    age = int(input("enter your age: "))
    print("Next year you will be", age + 1)
except ValueError: 
    print("That is not a valid age.")

# Error Handling pt. II w/ while 

while True: 
    try: 
        number = int(input("Enter a positive number: "))
        if number > 0:
            break
        else: 
            print("Number must be positive.")
    except ValueError:
        print("Invalid input. Please enter a valid number.")

print("Valid number received: ", number)

