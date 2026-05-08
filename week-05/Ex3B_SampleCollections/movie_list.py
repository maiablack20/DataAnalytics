# Maia Black 
# 2026-05-08

# Create a list with the titles of your favorite movies (or movies you’d like to watch) – include at least 2, but no more than 10.

favorite_movies = ["Coraline","Kill Bill", "ParaNorman", "The Devil Wears Prada", "Cheetah Girls 2"]

# Use the len() function to print the descriptive statement: The list [list name] includes my top [length] favorite movies(Or: The list [list name] includes the [length] movies I’d like to watch

length = len(favorite_movies)

print("My favorite movie list",favorite_movies, "includes my top",(length), "favorite movies")

print(favorite_movies)

# Print a sorted list two ways (Note: make sure that your list items aren’t already in alphabetical order to start with, or you won’t notice any difference):

    # a) Use the sorted() function to print a sorted list, then print the list again without using sorted()

print(sorted(favorite_movies))

    # Results received from using this function: "Cheetah Girls 2", "Coraline", "Kill Bill", "ParaNorman", and "The Devil Wears Prada". 

print(favorite_movies)

    # Results received from using this function: "Coraline", "Kill Bill", "ParaNorman", "The Devil Wears Prada", "Cheetah Girls 2". 

# Use the .sort() method to sort the list, then print the list again, like this:

favorite_movies.sort()
print(favorite_movies)

# What do you notice when you compare the two outputs?

    # What I noticed when comparing the two outputs is that bothed "sort" functions provided me the same results with the list being put in alphabetical order while also being functionally different. One of the functions requires me to input it as "listname.sort" and the other requires me to use "sort(listname)" with the print function. Both are very different in how they ware formatted, but both of them provide the same type of results.

# Think of at least one more movie to add to your list, and use the .append() method to add it. Then print the list again, also including an updated description statement.

favorite_movies.append("Tales From The Hood")

length = len(favorite_movies)
print("My favorite movie list",favorite_movies, "includes my top",(length), "favorite movies")

print(favorite_movies)

    # I achieved different results this time with the addition of the movie I added, which was "Tales From The Hood". My len function results changed from five to six with the addition of the movie and so did my print statement. Overall, when you have a new variable added to your data, then it tends to change it either minimally or drastically. 