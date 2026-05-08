# Maia Black 
# 2026-05-08

# A colleague has shared the following contact records, but the data is a mess, with inconsistent capitalization and currency symbols that need to be cleaned up before it can be used:

name_1 = "PRIYA SHARMA"
name_2 = "bob NGUYEN"
name_3 = "LaTonya Williams"
salary_1 = "$82,500"
salary_2 = "$74,000"

# a.) Use .lower() to convert all three names to lowercase, and print each result.

name1 = name_1.lower()
print(name1)

name2 = name_2.lower()
print(name2)

name3 = name_3.lower()
print(name3)

# b.) Use .title() to convert all three names to title case (first letter of each word capitalized), and print each result. (This is another useful method you can use alongside .upper() and .lower().)

converted_name1 = name_1.title()
print("The converted name for the first person is: ",converted_name1)

converted_name2 = name_2.title()
print("The converted name for the second person is: ",converted_name2)

converted_name3 = name_3.title()
print("The converted name for the third person is: ",converted_name3)

# c.) Use .replace() to remove the $ from both salary strings, and print each result. Add another print statement to test what data type these values are now. What would you need to do next to perform math on them?

# d.) Now chain .replace() and int() together in a single line to produce a usable integer from salary_1. Print the result and confirm its type using type().

salary1 = int(salary_1.replace("$","").replace(",", ""))
print("The first salary: ", salary1)
print(type(salary1))

salary2 = int(salary_2.replace("$", "").replace(",",""))
print("The second salary: ", salary2)
print(type(salary2))