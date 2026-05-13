# Maia Black
# 2026-05-12 

#demonstrates global scope 

# Demonstrates local scope 

def myfunction(): 
    x = 300
    print(x)

myfunction() 

# Demonstrates enclosed scope

def outer_func():
    x = 'YearUp'
    def inner_func():
        print(x)
outer_func()