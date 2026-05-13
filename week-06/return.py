# Maia Black
# 2026-05-12
# demonstrates a return statement

def greeting():
    name = input("Please enter your name: ")
    return name

result = greeting()
print(f"Hello, {result}!")

# Multiple parameters
# Python automatically packages multiple return values into a tuple 

def greeting(name, city, hobby):
    return name, city, hobby

result = greeting(
    input("Please enter your name: "),
    input("Please enter your city: "),
    input("Please enter your hobby: ")
)

print(type(result))

print(f"Hello, {result[0]}! You are from {result[1]} and you enjoy {result[2]}.")

# Write a Python Program with a function that demonstrates: 
    # Return statement 

major_name = input("Enter the name of your major")
name = input("Please enter your name: ")