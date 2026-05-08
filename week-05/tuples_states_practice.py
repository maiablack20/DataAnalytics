# Maia Black 
# 2026-05-07
# Working With Tuples (U.S. State Data)

from itertools import count


t = ("Alabama", "Georgia", "Texas", "Mississippi", "Florida") 

# Total number of states in the tuple
print(len(t))
input = (f"Total number of states: ")

    # The total number of states is 5 because there are five states listed within the tuple. 

# Display the first state and the last state in the tuple
print({t[0]})
print(t[-1])

    # The first state in the tuple is Alabama because it is the first one listed and the last state listed is Florida because that was the last one listed. 

# Display the state in alphabetical order
print(sorted(t))

    # The syates listed in alphabetical order are Alabama, Florida, Georgia, Mississippi, and Texas. 

# Find and display the length (number of characters of the longest state name). 

# Iterate with a for loop 
my_set = ("Alice", "Bob", "Charlie")

for item in my_set: 
    print(item)

    # The result received is Alice, Bob, and Charlie

# Membership text with in 
my_set = (1, 2, 3, 4, 5)

print(3 in my_set)
print(9 in my_set)

    # The results received were "True" and "False"

# Convert to a list -- then access by index 
my_set = (1, 2, 3, 4, 5)

my_list = list(my_set)
print(my_list[2])

    # My result is 3. 

# Convert to a sorted list -- access in a predictable order. 
my_set = (1, 2, 3, 4, 5)

my_list = sorted(my_set)
print(my_list[2])

    # Result is 3.

# Unpacking -- assign elements to variables (order not guaranteed) 
my_set = (1, 2, 3, 4, 5)

a, b, c, d, e = my_set
print(a, b, c, d, e)

    # Result is 1, 2, 3, 4, 5. 

# Unorders

my_set = {3, 1, 2}
print(my_set)

# no duplicates 

my_set = {1, 2, 3, 3, 3, 3}
print(my_set)

# mutable 

my_set = {1,2,3}
my_set.add(4)
print(my_set)

# mutable 

my_set = {1,2,3}
my_set.remove(2)
print(my_set)

# mutable 

my_set = {1,2,3}
my_set.discard(2)
print(my_set)

# iteration 

my_set = {1,2,3}
for item in my_set:
    print(item)

# unindexable 

#my_set = {1,2,3}
#print(my_set[0])

#############################################

# Working With Set (U.S. States Data) Practice Pt. 2 
# 2026-05-08

my_set = {"Alabama", "Georgia", "Texas", "Mississippi", "Florida"}

    # a.) Display the total number of states in the set using a built-in function. 

print("Total number of states within the set: ",len(my_set))

    # b.) Use a built in function to determine if "Texas" is in the set. 

my_set = {"Alabama", "Georgia", "Texas", "Mississippi", "Florida"}
print("Is Texas within my set?: ",("Texas" in my_set))

# Remove "Florida" from the set using discard

my_set = {"Alabama", "Georgia", "Texas", "Mississippi", "Florida"}

my_set.discard("Florida")
print(my_set)
