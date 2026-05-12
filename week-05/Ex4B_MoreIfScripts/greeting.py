# Maia Black
# 2026-05-11

# Greeting Exercise 

# Define a variable that contains the current hour (0-23)

# Display one of the greetings below based on the current hour:

#Time Greeting:
# 10:00am Good morning!
# 10:00am until 5:00pm Good day!
# 5:00pm or later Good evening!

current_hour = int(input("Enter the current time: "))

if current_hour < 10:
    print("Good morning!")

elif current_hour <= 17: 
    print("Good day!")

elif current_hour <= 23:
    print("Good evening!")
else: 
    print("Invalid hour input! Please try again")