# Maia Black 
# 2026-05-17 
# Using lambda functions within Python

# Function: doubler
doubler = lambda n: n * 2

n = 8
print(doubler(8))
    # Result received is 16. 

n = -4
print(doubler(-4))
    # Result received is -8 

n = 'banana'
print(doubler('banana'))
    # Result received is 'bananabanana'. 


# Function: tripler
tripler = lambda n: n * 3

n = 8 
print(tripler(8))
    # Result received is 24. 

n = -4 
print(tripler(-4))
    # Result received is -12.

n = 'banana'
print(tripler('banana'))
    # Result received is 'bananabananabanana'.

def multiplier(m):
    return lambda n: n * m
quadrupler = multiplier(4)
print(quadrupler(4))
    # Result received is 16. 

quintuplier = multiplier(5)
print(quintuplier(5))
    # Result received is 25. 

sextupler = multiplier(6)
print(sextupler(6))
    # Result received is 36. 

septupler = multiplier(7)
print(septupler(7))
    # Result received is 49. 

octupler = multiplier(8)
print(octupler(8))
    # Result received is 64. 

nonupler = multiplier(9)
print(nonupler(9))
    # Result received is 81. 

decupler = multiplier(10)
print(decupler(10))
    # Result received is 100.

# Test Value: 12 
dodecuplet = multiplier(12)
print(dodecuplet(12))
    # Result received for test value is 144. 