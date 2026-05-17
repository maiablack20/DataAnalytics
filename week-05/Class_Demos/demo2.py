# Maia Black
# 2026-05-07

# Using the "If" statement
num = 5
if num > 5: 
    print("Hello")
elif num < 5:
    print("Goodbye")
else:
    print("Hi")
print('Done')

    # For example one, "Done" is the only result being printed because num is equal to 5, but not greater than it. 

    # For example two, "Hi" and "Done" are being printed because 

    # For example three, the only thing that had pritned were "Hi" and "Done" because the number 5 is not less than 5. 

num = int(input("Enter a number: "))
if num > 0: 
    print("Positive")
elif num < 0:
    print("Negative")
else:
    print("Zero")
print('Done')

# Using the While loop 
num = 5
while num > 0:
    print("Hello")
    num -=1

    # "-=1" is condition control for a loop because it limits the amount of times that a statement is printed. 

# Using the "for" loop
for item in [1, 2, 3, 4]:
    if item == 2:
        break
    print(item)

    # Once the "break" statements gets to "2" it stops, but if the break were not there, then it would continue.


# Using "continue" statements
for item in [1, 2, 3, 4]:
    if item == 2:
        continue 
    print(item)

        # When you place "continue" in the code, then it skips over the number two and continues until the number four. 

# Using "pass" in code
for item in [1, 2, 3, 4]:
    if item == 2:
        pass
    print(item)

    # It passes over all numbers and does not print anything. 