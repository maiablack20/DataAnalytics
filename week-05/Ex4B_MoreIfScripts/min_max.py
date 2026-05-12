# Maia Black
# 2026-05-12

# Minimum and Maximum Exercise with If statements

# a.) Create a script that displays both the smallest and then the largest of three numbers. 

# b.) Name your variables a, b, and c and assign them values. Then use if/else statements to determine and display the answer.

a = int(input("Enter a value: "))
print("The value for a is: ", a)

b = int(input("Enter a value: "))
print("The value for b is: ", b)

c = int(input("Enter a value: "))
print("The value for c is: ", c)

if a < b and a < c: 
    print("The smallest value is a", a)
elif b < a and b < c:
    print("The smallest value is b", b)
elif c < a and c < b:
    print("The smallest value is: ", c)

if a > b and a > c: 
    print("The largest value is a", a)
elif b > a and b > c: 
    print("The largest value is b", b)
elif c > a and c > b: 
    print("The largest value is c", c)
else:
    print("Two or more values are equal.")

# After testing multiple variables, I was provided with both the smallest and largest variables of each set, which showed that my script was working properly. At first, there was the issue of just the smallest value being shown, but after separating the if statements for the smallest and largest values, it displayed them properly rather than putting them altogether and completing disregarding the largest value.