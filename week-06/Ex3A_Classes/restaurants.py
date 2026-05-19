# Maia Black
# 2026-05-19 
# Lab 1. Working with Classes: Restaurant


class Restaurant:
    '''The purpose of the class is to include the name of the restaurant and to label the food type within the restaurant'''

    def __init__(self, rest_name, food_type):
        self.rest_name = rest_name 
        self.food_type = food_type
    
    def describe_rest(self):
        print(f"{self.rest_name} serves {self.food_type}")
    def rest_open(self):
        print(f"{self.rest_name} is open")
restname = Restaurant("Prairie Cottage", "Southern Comfort Food")
restname2 = Restaurant("Manon's Atelier", "French Cuisine")
restname3 = Restaurant("Class of Itaewon", "Korean Food")

restname.describe_rest()
restname2.describe_rest()
restname3.describe_rest()

restname.rest_open()
restname2.rest_open()
restname3.rest_open()