# Maia Black 
# 2026-05-19 
# Lab 1. More Fun With Classes


class Restaurant:
    '''The purpose of the class is to include the name of the restaurant and to label the food type within the restaurant'''

    def __init__(self, rest_name, food_type, number_served = 0, customer_ratings = []):
        self.rest_name = rest_name 
        self.food_type = food_type
        self.number_served = 0
        self.customer_ratings = []
    def describe_rest(self):
        print(f"{self.rest_name} serves {self.food_type}")
    def rest_open(self):
        print(f"{self.rest_name} is open")
    def add_num_served(self):
        number_served = int(input("How many customers were served today? "))
        self.number_served = self.number_served + number_served
    def print_num_served(self): 
        print(f"{self.rest_name} has served {self.number_served} customers.")
    def customer_rating(self):
        valid = False
        while not valid: 
            try:
                ratings = int(input(f"How would you rate your expereince today on a scale of 1-5(5 being excellent)?" ))
                if ratings >= 1 and ratings <= 5:
                    valid = True
                    self.customer_ratings.append(ratings)
                    average = sum(self.customer_ratings)/   (len(self.customer_ratings))
                    print(f"Your rating was {ratings}. The average rating for this restaurant is {average}.")
                else: 
                    print("The number you have input is out of range.")
            except: 
                print("Please input a valid number for your rating.")




restname = Restaurant("Prairie Cottage", "Southern Comfort Food")
restname2 = Restaurant("Manon's Atelier", "French Cuisine")
restname3 = Restaurant("Class of Itaewon", "Korean Food")

restname.describe_rest()
restname2.describe_rest()
restname3.describe_rest()

restname.rest_open()
restname2.rest_open()
restname3.rest_open()

restname.print_num_served()
restname2.print_num_served()
restname3.print_num_served()

restname.add_num_served()
restname.print_num_served()

restname2.add_num_served()
restname2.print_num_served()

restname3.add_num_served()
restname3.print_num_served()

restname.customer_rating()
restname2.customer_rating()
restname3.customer_rating()