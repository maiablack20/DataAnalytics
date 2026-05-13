# Maia Black
# 2026-05-2026

# Number Guesser Exercise

# Write a simple game that you can run in a terminal that generates a random integer and makes the user guess that integer using input() until they guess correctly.

import random 
secret_number = random.randint(1,100)
   
guess_count = 0
total_guesses = []

while True:
     try:
        guess = int(input("Please enter a random number: "))
     except:
        print("Are you sure you input a number? Try again.")
        continue
     if guess == secret_number: break
     if guess < secret_number:
        print("Try guessing a little higher.")
     elif guess > secret_number:
       print("Try guessing a little lower.")
     guess_count = guess_count + 1
     total_guesses.append(guess)
     print("# of guesses made so far: ", guess_count)
if guess_count < 5:
   print("You're awesome! You used less than 5 guesses")
print("Amazing job! You guessed correctly!")
print("Total number of guesses: ", guess_count)
print("Total guesses overall: ", total_guesses)

# Bonus add-ons:
    #  a) Keep track of the number of guesses
    # b) Collect all the guessed numbers and print them at the end
    # c) If the user takes less than 5 guesses, print that they’re awesome
    # d) Makes the program safe for non-numeric input (meaning, how does the program respond if the user types something that’s not a number?)