# Maia Black 
# 2026-05-13
#Program: Statistic Module 

import statistics

# Sample datatset
data = [10, 20, 20, 40, 50]

print("=== Pything Statistics Module Demo ===\n")

# mean() -> average value 
print("mean: ", statistics.mean(data))

# median() -> middle value 
print("median: ", statistics.median(data))

# mode -> most common value 
print("mode: ",statistics.mode(data))

# stdev() -> standard deviation (sample)
print("stdev: ", statistics.stdev(data))

# variance -> variance(sample) 
print("variance: ", statistics.variance(data))

# demonstrates lambda functions 

# lambda arguments: expression 
# contains any number of arguments but contains only one expression 

# Lambda function to double a number 
doubler = lambda n: n * 2
print(doubler(5))

# Lambda function to add a number 
add_numbers = lambda a, b: a + b
print(add_numbers(3,7))

# Lambda function to determine largest number 
largest = lambda x , y: x if x > y else y
print(largest(12, 8))

# demonstrates list comprehension 

# Create a list of Squares 
numbers = [1, 2, 3, 4, 5]
squares = []

for n in numbers: 
    squares.append(n ** 2)

print(squares)