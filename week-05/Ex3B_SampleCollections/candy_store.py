# Maia Black 
# 2026-05-08 

# Start by creating two tuples: one that lists at least 3 types of candy that can come in fruit flavors, and another that lists at least 3 fruity flavors. (Feel free to get creative with your flavor ideas...)

t1 = ("Strawberry", "Lemon", "Grape")
t2 = ("Blue Raspberry", "Peach", "Lime")

# Now create a new variable to store candy combinations as a set. Using the index of each tuple, add at least one combination of each candy and flavor to the new set – for example, putting together tuple1[0] and tuple2[1]

t3 = {t1[0] + " " + t2[1], t1[1] + " " + t2[2], t1[2] + " " + t2[0], t1[1] + " " + t2[1], t2[0] + " " + t1[1]}
print("Today's candy options include: ", t3)

    # What I noticed about the order of the items that I put out is that it's not in alphabetical order due to the ordering of the flavors in the tuple and this is because the system is following the ordering that I provided, which means I would need to order it to my liking. However, when I repeat the output, the order becomes different each time with a different flavor of candy at the start and end. 

