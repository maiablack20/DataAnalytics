# Maia Black 
# 2026-05-15
# Math and Stats Functions Exercise 

import random
import math
import statistics

vals_1_100 = range(1,100)
vals_sample = random.sample(vals_1_100, 75)
vals_choices = random.choices(vals_1_100, k = 200)
radius = random.randint(3,10)
pi = math.pi

print("__Experimenting with a subset of integers 1-100: ")

    # Sum of 75 sample values from 1 to 100:
total_sum = sum(vals_sample)
print("Here is the Total Sum: ", total_sum)

        # The total sum of the values is: 3,821. 

    # The average of 75 sample values: 
calculated_average = statistics.mean(vals_sample)
print("The average of the sample values is: ", calculated_average)

    # The median of 75 samples: 
sample_median = statistics.median(vals_sample)
print("The median of the sample values is: ", sample_median)

        # The median of the 75 sample values is: 50. 

print('\n')

print("__Experimenting with a superset of 200 values, integers 1-100:") 

    # Average of 200 values
values_average = statistics.mean(vals_choices)
print("The average of 200 values is: ", values_average)

        # The average of 200 values between integers 1 and 100 is: 45.45

    # Median of 200 values: 
values_median = statistics.median(vals_choices)
print("The median of the sample values: ", values_median)

        # The median is: 54.5 

    # Mode of 200 values: 
values_mode = statistics.mode(vals_choices)
print("The mode of the 200 values is: ", values_mode)

        # The mode of the 200 values is 76.

    # Standard Deviation of 200 values: 

values_stdev = statistics.stdev(vals_choices)
print("The Standard Deviation of the 200 values is: ", values_stdev)

        # The standard deviation of the 200 values is 27.96

    # Variance of 200 values

values_variance = statistics.variance(vals_choices)
print("The variance of 200 values is: ", values_variance)

        # The variance of 200 values is: 884.48

print('\n')

print("___Modeling a random circle: ")

random_circle = pi * (radius ** 2)
print(" Radius = ", radius, "area = ", math.ceil(random_circle))
print("Radius = ", radius, 'area = ', math.floor(random_circle))

        # Radius is 7 and the area is 154 when using math.ceil; radius is 7 and the area is 153 when using math.floor. 