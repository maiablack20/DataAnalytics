# Maia Black 
# 2026-05-15

# Sampling Tools 

import random

products = ['Laptop', 'Monitor', 'Keyboard', 'Mouse', 'Webcam', 'Headset', 'Docking Station', 'USB Hub', 'Desk Lamp', 'Surge Protector']

daily_products = random.choice(products)
print("Product of the Day: ", daily_products)

    # The returned result of this is: 'Docking Station'. 

daily_products = random.sample(products, 3)
print("Products for Usability Survey: ", daily_products)

    # The returned result of this is: 'Docking Station', 'Keyboard', and 'Surge Protector'. 

random.shuffle(products)
print("All Products Displayed: ", products)

    # Returned result of this is: ['Headset', 'Webcam', 'Keyboard', 'Laptop', 'Docking Station', 'Mouse', 'Monitor', 'Surge Protector', 'USB Hub', 'Desk Lamp']

daily_transaction_count = random.randint(50, 300)
print("Daily Transaction Count: ", daily_transaction_count)

    # The returned result is 202 for the daily transaction count. 

# With each run of the script, the order of the products changes when you display all of them, but the only constant with the other functions is that 'Docking Station' remains the same while the other products become different. As for the transaction count, it has a period of where it rises and or when it lowers as well, which means that the number of transactions goes up or down each day. 