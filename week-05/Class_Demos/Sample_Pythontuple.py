# Introduction to Python
# Author : Maia Black
# 2026-05-07
# Program: Sample Python tuple 

student = ("Alice", 20, "Data Analytics", 3.5, True)

print(student)
print(f"Name: {student[0]}")
print(f"Age: {student[1]}")
print(f"Major: {student[2]}")
print(f"GPA: {student[3]}")
print(f"Active: {student[4]}")
print(f"Length: {len(student)}")

# Quick Check 
# Function being used: Count(x)

t = (1, 2, 2, 3, 2)
print(t.count(2))

    # Count(x) = 3 and it is counting the amount of 2's within the tuple. 

# Function being used: Index(x)
print(t.index(2))

    # The result of this is 1 because the first time we see two within the the tuple is at index 1. 

# Function being used: len(t)
print(len(t))

    # The result received from this is 5 because there are five numbers within the tuple. 

# Function being used: min(t)
print(min(t))

    # The result provided is 1 because that is the lowest number within the tuple. 

# Function being used: max(t)
print(max(t))

    # The result is three because that is the highest number that has been listed. 

# Function being used: sum(t)
print(sum(t))

    # The result is 10 because that is the total of all the numbers within the tuple. 

# Function being used: sorted(t)
print(sorted(t))

    # The function sorted it in numerical order from smallest to largest. 



# Quick Check 2

# Function b"eing used: index

t = ("a", "b", "c")
print(t[0])
print(t[-1])

    # The result of this is a and c. 

# slice
t= (1, 2, 3,4, 5)
t[1:4]
print(t[1:4])

    # The result is 2, 3, and 4. 

# Concatenation 
t = (1, 2, 3)
t2 = ("a", "b", "c")
t3 = t + t2
print(t3)

 # The result is (1, 2, 3, 'a', 'b', 'c') because the two tuples were combined together.

# Repetition
t = (1, 2, 3)
t2 = t * 3
print(t2)

    # The result is (1, 2, 3, 1, 2, 3, 1, 2, 3) because the tuple was repeated three times.

# Membership 
t = (1, 2, 3) 
print(2 in t)

    # The result is true because 2 is within the tuple.

# Uniqueness 
t = (1, 2, 3, 4, 5)
print(len(set(t)))
    # The result is 5 because there are five unique numbers within the tuple.

# Convert to list 
t = (1, 2, 3, 4, 5)
print(list(t))
    
    # The result is [1, 2, 3, 4, 5] because the tuple was converted to a list.