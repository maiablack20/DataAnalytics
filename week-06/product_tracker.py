# Maia Black
# 2026-05-13

# Product Inventory System for Stockmart, Inc. 
class Product: 
    def __init__(self, name, category, price, quantity):
            self.name = name
            self.category = category
            self.price = price
            self.quantity = quantity
    def display_info(self): 
            print(f"Product Name: {self.name}")
            print(f"Product Category: {self.category}")
            print(f"Product Price: ${self.price:.2f}")
            print(f"Product Quantity: {self.quantity}")
            print("------------------------")

product1 = Product("Organic Valley's Artesian", "Bread", 4.00, 15)
product2 = Product("Florette's Dijon", "Condiment", 2.99, 2)
product3 = Product("Pink Sweets' Watermelon Sours", "Candy", 4.95, 23)
product4 = Product("Sweet Pea's Sweet Tea", "Tea", 6.00, 8)

print(f"Product 1: {product1.name} {product1.category} ${product1.price:.2f} {product1.quantity}")
print(f"Product 2: {product2.name} {product2.category} ${product2.price:.2f} {product2.quantity}")
print(f"Product 3: {product3.name} {product3.category} ${product3.price:.2f} {product3.quantity}")
print(f"Product 4: {product4.name} {product4.category} ${product4.price:.2f} {product4.quantity}")

product1.display_info()
product2.display_info()
product3.display_info()
product4.display_info()