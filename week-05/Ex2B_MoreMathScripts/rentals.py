# Maia Black
# 2026-05-07
# Calculating the rentals for charter vans 

# There are X people going on a tour. Charter vans seat 15 passengers each. Vans cost $250 per day to rent (including the driver’s pay). How many vans do you need? How much will it cost to rent vans? What is the cost if you split it per person?

import math

rental_cost = 250 
passengers_per_van = 15

van_passengers = float(input("Enter the amount of passengers: "))

vans_needed = math.ceil(van_passengers/passengers_per_van)
print("Total Vans Needed: ",vans_needed) 

total_cost = (rental_cost * vans_needed)
print("Total Rental Cost: $", total_cost)

cost_per_person = (total_cost/van_passengers)
print("Cost Per Passenger is: $",(round(cost_per_person,2)))

# Test the script with 38 tourists. 

    # a.) The script stated that I needed to charge $19.74 per person. 

    # b.) I collected $750.12, which is more than the total rental cost. The reason in which this is $0.12 over the projected total cost is because of the decimal point for the cost per person, which is $19.74. 

    # c.) Cost of the vans is $750.12

    # d.) The reason in which I have the leftover money is because of the decimal point for the cost per passenger being $19.74, which put us over the total rental cost. 

# This became easier as I continued to write the scripts. 