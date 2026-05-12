# Maia Black 
# 2026-05-12

# Ranked List Exercise 

# Create a list of at least 5 items using anything you like: favorite foods, pets, cities you'd like to visit, skills you want to develop, etc. 

cities_to_visit = ["Tokyo", "Mykonos", "Rome", "Bangkok", "Chongqing"]

# Use enumerate() with a for loop to print each item as a numbered list, starting at 1.
# Example:
# 1. tacos
# 2. ramen
# 3. jerk chicken
# 4. injera
# 5. pierogi

for index, item in enumerate(reversed(cities_to_visit), 1):
    if index == 1: 
        print(f"{index}.{item} <-top pick!")
    else: 
        print(f"{index}.{item}")

# Now add an if statement inside your loop: if the index is 1 (i.e., the first item), also.print " <- top pick!" on the same line.

# BONUS: Modify your loop to print the list in reverse order (still numbered 1 through 5) using reversed() around your list.