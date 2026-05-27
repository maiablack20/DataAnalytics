# Maia Black
# 2026-05-26 
# Lab 1. Working with Exceptions using ValueError, NameError, TypeError, and SyntaxError


# ValueError
try: 
    x = float("oogly boogly")
except ValueError: 
    print("This value is within the incorrect format.")
else: 
    print("You were correct!")
finally: 
    print("Let's try another!")

# NameError: 
try:
    print(y)
except NameError: 
    print("Please try again!")
else: 
    print("Yay! It worked!")
finally: 
    print("Let's try another value!")

# TypeError: 
try: 
    x = "Mindless Behavior" + 25.5
    print(x)
except TypeError:
    print("Error. Please select different values.")
else: 
    print("It worked! Pat yourself on the back!")
finally: 
    print("Would you like to try another set of values?")

# SyntaxError: 
try:
    a = eval("Wonder Girls * 1")
    print(a)
except SyntaxError:
    print("Error detected. Please correct the string.")
else: 
    print("Error has been corrected. Please try again.")
finally: 
    print("Would you like to try another value?")