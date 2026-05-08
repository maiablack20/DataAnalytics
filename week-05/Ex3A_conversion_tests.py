# Maia Black
# 2026-05-07

# Description: This script tests various numeric conversion techniques
# Author: Sam Q. Newprogrammer

a = " 101.1 "
b = '55'
c = "402 Stevens"
d = 'Number 5 '

# a) Conversion Techniques

original_conversion = input("Enter the number to convert: ")

# converted_variable = int(a) is an error because the string does contan a decimal when it really needs to be a while number in order for it to become a integer. 

converted_variable = float(a)
print(original_conversion, "Converted from string to a float: ", converted_variable)

    # Result received is 101.1
###############################################

original_conversion = input("Enter the number to convert: ")
converted_variable = int(str(b))
print(original_conversion, "Converted from string to integer: ", converted_variable)

    # Result received 55

###############################################

original_conversion = input("Enter the variable to convert: ")

# converted_variable = float(str(c)) is an error because the string contains letters and a space between the numbers and letters that would make it impossible for it to become a float.

# converted_variable = str(c.split(c))

# print(original_conversion, "Convert from a string to a float: ", converted_variable)

# converted_variable = print(int(c)) - ValueError

    # The error I receive from these two is a ValueError due to the fact that "402 Stevens", or option "c" was due to the fact that it was a string with a mix of letters and numbers. 

# Result received is ValueError

###############################################

# original_conversion = "Number 55"

# converted_variable = float(str(d))

    # This produced a ValueError as well because the string "Number 55" is not able to become a float nor an integer, which means it would stay the same. 
    # Result received is ValueError
###############################################

# 5.) Casting as integer and float 

    # a.) Casting as an integer:

        # 1.) a. "101.1"
print(int(float(" 101.1")))
    # The result obtained from this is that the one decimal place was dropped and "101.1" became "101" instead due to being converted into an integer. 

        #2.) b. '55'
print(int(float('55')))
    # The result obtained from this is that it became an integer immediately and there weren't decimals dropped from it. 

        #3.) c. "402 Stevens"
# print(int(float(str("402 Stevens"))))

    # I received an error when creating this formula because it was a little too complex or a little too jumbled for my systen because I received a ValueError, which may be due to the fact that "402 Stevens" is a string with a mix of letters and numbers, which makes it hard for it to become an integer or a float. 

    
        # 4.) 'Number 5'
# print(int(str('Number 5 ')))

    # The error received for this is a ValueError as well, which means that since 'Number 5' is the same as '402 Stevens', then that means it cannot easily become an integer. 

    # b.) Casting as a float

        #1. "101.1"
print(float(str(" 101.1")))

        # The result received from this function is that "101.1" became a float rather than continuing to stay as a string. 

        #2.'55'
print(float(str('55')))

        # The result of '55' becoming a float is that it added a .0 at the end of the number. So now as a float it states 55.0. 

        #3. "402 Stevens"
# print(float(str("402 Stevens")))

        # The result of "402 Stevens" becoming a float resulted in a ValueError, which means that since it's a mix of letters and numbers, then it cannot become a float like '55' or '101.1' could. 

        #4. "Number 5"
# print(float(str("Number 5 ")))

        # This value also brought bak a ValueError, which means that like "402 Stevens", it could not become a float because it had letters and numbers in it. 

# c.) Making variable a into an integer after it was converted to a float. 

new_variable = ((int(float(input("Enter the original_variable: ")))))
print(new_variable)

    # The result for variable "a" was the same as the result for the first question where it asked me to convert it to an integer. Once it became an integer, variable "a" went from "101.1" to "101". 

# d.) Creating a new variable using slicing

    # 1.) Variables: 
num1 = float(a[1:6])
print(num1)


num2 = int(b[0:2])
print(num2)

num3 = int(c[0:3])
print(num3)

num4 = int(d[7:8])
print(num4)

    # e.) Using the .strip() function to remove the leading/trailing spaces, within a print statement to display each result. 
        # 1.) Variable: "a"
new_variable = a.strip()
print("This is the new variable: ",new_variable)