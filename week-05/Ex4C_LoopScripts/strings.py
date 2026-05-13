# Maia Black
# 2026-05-12

# Demonstrating features of strings as a sequence in Python 

# 1. Creating a string 

text = "Python"

# 2. Indexing (positive and negative)

print("First character: ", text[0])
print("Last character: ", text[-1])

# 3. Slicing
print("first three characters: ", text[0:3]) 
print("From index 2 to end: ", text[2:])
print("every second character: ", text[::2])

# 4. Iteration

print("Characters in string")
for char in text:
    print(char, end=" ")
print()

# 5. Membership testing
# print("'Py' in text?", "Py" in text)
# print("'Java' in text?", "Java" in text)

# Parsing a string 

#

# String Split

text = "Maia Black"
x = text.split(" , ")
print(x)