# Maia Black
# 2026-05-12 

# Savings Goal Exercise 

# Create a variable for your starting bank balance, another that sets your savings goal, and a third with your weekly savings amount.

# Use a while loop to compare your bank balance to your savings goal, if you haven’t met your goal yet, add the weekly savings amount to your bank balance. For each loop, print the statement, “This week my balance increased to ___.” Once your savings goal is met, print the statement, “Goal met! My current balance is ___.

starting_balance = 3000 
savings_goal = 12000 
weekly_savings = 500

while starting_balance < savings_goal:
    starting_balance = weekly_savings + starting_balance
    if starting_balance > savings_goal * 0.75:
        starting_balance = starting_balance - 300
        print("So close! After treating myself, my balance is up to: ", starting_balance)
    elif starting_balance > savings_goal * 0.50:
         print("Almost there! This week my balance is up to: $", starting_balance)
    else: 
        print("This week my balance increased to: $", starting_balance)
print("Goal met! My current balance is: $", starting_balance)

# Try adding additional logic to your loop:

    # a) If your balance is more than halfway to your goal, print the message, “Almost there! This week my balance is up to ___.”
    
    # b) If your balance is at least 75% of your goal, add a calculation to buy yourself a little treat. Print the message, “So close! After treating myself, my balance is up to ___.”

# I was a little tripped up on how to incorporate the cost of the treat in the loop, but then after figuring it out, it was the same method as I used when I was mainly focused on if statements within my other exercises. My issue regarding Python overall is that I tend to overcomplicate things to the point of where I am confusing myself. 