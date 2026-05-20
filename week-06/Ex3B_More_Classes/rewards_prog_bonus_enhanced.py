# Maia Black
# 2026-05-20
# Working with Classes Bonus Exercise

import math
cust_list = []

class RewardsProgram:
    '''The purpose of the class is to create a rewards program for patrons of the restaurant'''


    def __init__(self, cust_name, phone, email):
        self.cust_name = cust_name
        self.phone = phone
        self.email = email
        self.restaurants_visited = []
        self.rewards_points = {}
    def profile(self):
        print(f"Name: {self.cust_name}")
        print(f"Phone: {self.phone}")
        print(f"Email: {self.email}")
    def thank_you(self):
        print(f"Thank you, {self.cust_name}, for visiting our restaurant!")
    def add_to_cust_list(self):
        cust_list.append((self.cust_name, self.phone, self.email))
    def visit_rest(self): 
        rest_name = input(f"Name of restaurant: ")
        if rest_name not in self.restaurants_visited: 
            self.restaurants_visited.append(rest_name)
        food_bill = math.floor(float(input("What was the total food bill for this visit? $")))
        self.calculate_rewards(food_bill, rest_name)
        print(f"Points for this visit: {food_bill}")
        print(f"Total rewards points earned: {self.rewards_points}")
        print(f"Thank you for visiting {rest_name}!")
    def calculate_rewards(self, food_bill, rest_name):
        if rest_name in self.rewards_points:
            self.rewards_points[rest_name] = self.rewards_points[rest_name] + food_bill
        else: 
            self.rewards_points[rest_name] = food_bill
            

rewards1 = RewardsProgram("Maria Sanchez", "296-333-0002", "maria_sanchez121@hotmail.com")

rewards2 = RewardsProgram("Lisa Nelson", "678-993-8900", "lisadave2000@aol.com")

rewards3 = RewardsProgram("Robin Banks", "320-898-5544", "oohshe_stealing98@ymail.com")

# Rewards 1 Call Function:
rewards1.profile()
rewards1.thank_you()
rewards1.add_to_cust_list()
rewards1.visit_rest()
print(f"==========================================")

# Rewards 2 Call Function:
rewards2.profile()
rewards2.thank_you()
rewards2.add_to_cust_list()
rewards2.visit_rest()
print(f"==========================================")

# Rewards 3 Call Function: 
rewards3.profile()
rewards3.thank_you()
rewards3.add_to_cust_list()
rewards3.visit_rest()
print(f"==========================================")

print(f"All Customers Have Been Added To Rewards Program: {cust_list}.")

