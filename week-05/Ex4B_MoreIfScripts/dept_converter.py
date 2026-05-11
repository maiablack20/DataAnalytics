# Maia Black
# 2026-05-12

# Department Converter Assignment


# Write a script named dept_converter.py that uses if/elif/else logic to determine and print department name based on a department code. Make sure to test your script with multiple codes.

department_code = int(input("Enter the department code: "))

if department_code == 1:
        print("Marketing")
elif department_code == 5:
        print("Human Resources")
elif department_code == 10: 
       print("Accounting")
elif department_code == 12:
        print("Legal")
elif department_code == 18: 
        print("IT")
elif department_code == 20: 
        print("Customer Relations")
else: 
        print("Error! Invalid department code! Please ensure you have the correct department code.")


# When you are done, compare scripts with a classmate. How did each of you approach solving this problem? Which solution do you think is most efficient? Which is easiest to read and understand? Are there any changes you would make to your own script based on seeing another example?

        # I approached solving the probkem by keeping it very simple when it came to the if and elif statements because it was much easier to say department_code = {x} rather than just overcomplicating it. There aren't changes I would make so far because this is pretty similar to a class assignment I had completed last week. 