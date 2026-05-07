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
