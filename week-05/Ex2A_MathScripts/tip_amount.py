# Maia Black 
# 2026-05-07

# Calculating the tip amount

# 3. How do you calculate the tip amount on a restaurant bill given the tip percentage?
    
    # a) Figure out the formula and what the script would look like, making up example values as needed. (If you need inspiration, what was your approximate restaurant bill the last time you ate at a restaurant?)

tip = int(input("Enter the desired tip percentage: "))
cost = int(input("Enter the total cost of your bill: "))

tip_amount = (cost * tip)/100
print(f"The tip on a ${cost} restaurant bill is: ${tip_amount:.2f}") 

# The results of this script after using 20 for the tip percentage and then $50 for the meal cost, my tip amount came to be $10.00. 

##############################################

# Lab 3: How much do you want to tip? 

    # 1.) The modified prompts are as follows: tip = int(input("Enter the desired tip percentage: "))and cost = int(input("Enter the total cost of your bill: ")). 

    # 2.) The pit falls of using input is that some customers might enter the actual numerical word, but not the numeral itself, which can lead to an error. What I observed when putting twenty into the "desired tip percentage" and "thirty" into the "bill amount" area is that writing out the word twenty and thirty,but not the number swill caused the system to return back an error. What I can say as a customer of such restaurants that allow you to input the desired amount you want to tip, will make sure that field is strictly for numerals and not for words. By keeping the payment systems strickly for numbers when customers are paying, the restaurants will have less errors popping up in their system as well. 