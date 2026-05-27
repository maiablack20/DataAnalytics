# Maia Black
# 2026-05-27
# Bonus Exercise w/ Name Game

your_name = input("Please enter your name: ")
explicit_name = ["bart", "buck"]

def trunc_name(your_name): 
    if your_name[0].lower() in 'aeiou':
        return your_name.lower()
    elif your_name[1].lower() not in 'aeiou': 
        return your_name[2:].lower()
    else: 
        return your_name[1:].lower()
# print(trunc_name("Stan"))

def name_game(your_name): 
    yield(f"{your_name}, {your_name}, bo-b{trunc_name(your_name)}")
    yield(f"bonana-fanna fo-f{trunc_name(your_name)}")
    yield(f"Me my mo-m{trunc_name(your_name)}")
    yield(f"{your_name}!")
if your_name.lower() in explicit_name:
    print("You are unable to proceed.")
# This part of the script is checking to see if a name is inappropriate or not and that includes names like "Buck" or "Tuck/Tucker", which can produce very explicit results. 
elif your_name.isalpha():
    try:
        for n in name_game(your_name):
            print(n)
    except IndexError:
        print("Please enter a valid name.")
# This part of the code is checking to see if the name is all letters or all numerals because an integer like 13 will cause the script to run, but it's also going to seem unfinished as well. 
else: 
    print("Please try again.")
    # raise SystemExit(0); commented out after testing it in the script myself to see what it does and how it works. 


# 2a.) What I noticed when I input an integer such as 13 in the script, the script ran as if the number was an actual name with out any issues. However, since it was an integer being used, it did not drop any vowels and replace them with consonants so certain lines look incomplete. Another thing I did notice was that when I typed out the word "thirteen", the script worked as if it was an actual name by dropping the consonant at the start for each line. 

# CHALLENGE: raise SystemExit(0) means that rather than printing a statement that says "Please try again" at the end of a script, it completely stops the script in its entirety without any type of print statements at the bottom. The raise SystemExit(0) function might be used in the else statements when an invalid input is placed in the input section and when it might produce unexpected results is when it can accidentally get caught as an exception and not actually exit. 