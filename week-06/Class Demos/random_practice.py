# Maia Black 
# 2026-05-13

import random

# 1. random.randint(a,b) -> Random integer between a and b(inclusive)

print("randint(1, 10): ", random.randint(1,10))

# 2. random.random() -> Random float betwen 0.0 and 1.0 
print("random(): ", random.random())

# 3. random.choice(seq) -> Random single element from a sequence 
fruits = ["apple", "banana", "cherry"]
print("choice(fruits): ", random.choice(fruits))

# 4 random.choices(seq, k=n) -> List of random k elements (with replacement)
print("choices(fruits, k=3): ", random.choices(fruits, k=3))

# 5. random.sample(seq, k=n) -> List of k unique random elements (without replacement)
print("sample(fruits, k=2): ", random.sample(fruits, k=2))

# 6. random.shuffle(seq) -> Shuffles a list in place 
numbers = [1, 2, 3, 4, 5]
random.shuffle(numbers)
print("shuffled numbers: ", numbers)