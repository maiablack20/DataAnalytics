# Maia Black
# 2026-05-19 
# Lab 3. Working with Classes: Restaurant Food Truck Bonus Exercise


class Restaurant:
    '''The purpose of the class is to include the name of the restaurant and to label the food type within the restaurant'''

    def __init__(self, rest_name, food_type):
        self.rest_name = rest_name 
        self.food_type = food_type
    
    def describe_rest(self):
        print(f"{self.rest_name} serves {self.food_type}")
    def rest_open(self):
        print(f"{self.rest_name} is open")
class FoodTruck(Restaurant): 
    '''This class is for the restaurant's food truck business that they run as well'''
    def __init__(self, rest_name, food_type):
        super().__init__(rest_name, food_type)
        self.private_bookings = 'N'
        self.truck_location = ""
        self.truck_relocation = []
    def accepts_private_bookings(self):
        self.private_bookings = input("Does this food truck accept private bookings? Y/N: ")
        if self.private_bookings == 'Y': 
            print("This food truck currently accepts private bookings.")
        else: 
            print("This food truck currently does not accept private bookings.")
    def relocate_truck(self):
        self.truck_location = input("Please enter the truck's current location: ")
        if self.truck_location not in self.truck_relocation: 
            self.truck_relocation.append(self.truck_location)
            print(f" The truck has been relocated due to unforseen circumstances. Here is the new location for today: {self.truck_location}")
            print(self.truck_relocation)
        print(f"Truck is currently located at {self.truck_location}")

# The reason in which I chose to instead show the restaurant's food truck being relocated rather than being duplicated is because I felt that duplicating the location would be a little cluttered, but having the restaurant inform the customers of a new location for the food truck if there are issues with the previous location, such as scheduling conflicts or any type of inclement weather, woudl be much more realistic and beneificial for the customers because they can be informed of the changes and still dine with them as well. 

restname = Restaurant("Prairie Cottage", "Southern Comfort Food")
restname2 = Restaurant("Manon's Atelier", "French Cuisine")
restname3 = Restaurant("Class of Itaewon", "Korean Food")
print(f"==========================================")

restname.describe_rest()
restname2.describe_rest()
restname3.describe_rest()
print(f"==========================================")

restname.rest_open()
restname2.rest_open()
restname3.rest_open()
print(f"==========================================")

restname = FoodTruck("Prairie Cottage", "Southern Comfort Food")
restname.describe_rest()
restname.accepts_private_bookings()
restname.relocate_truck()
print(f"==========================================")

restname2 = FoodTruck("Manon's Atelier", "French Cuisine")
restname2.describe_rest()
restname2.accepts_private_bookings()
restname2.relocate_truck()
print(f"==========================================")

restname3 = FoodTruck("Class of Itaewon", "Korean Food")
restname3.describe_rest()
restname3.accepts_private_bookings()
restname3.relocate_truck()

# 