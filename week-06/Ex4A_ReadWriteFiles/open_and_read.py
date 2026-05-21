# Maia Black
# 2026-05-20 
# Opening and reading a file.

with open("about_me.txt", "r") as f:
    # print(f.readline(10))
    x = f.read(50)
    y = []
    for i in range(1, 5):
    # print(f.read(50))
    # print(f.read(50))
        # print(f.readline())
        # print(f.readlines(1))
        # print(f.readlines(1))
        # print(f.readlines(100))
        # print(f.readlines(-1))
        # print(f.read(50))
        y.append(f.readline())
    z = f.readlines(100)

print(f"First 50 characters: {x}")
print(f" Next four lines, as list by line {y}")
print(f" Next 100 characters, as list by line, rounded up to complete lines: {z}")


# 12. What changed regarding the output is that it does not print out the full contents of the print statement, but rather it prints out 50 characters from the txt file. 

# 13c.) What changes in the output is that it only reads ten characters within a line and outputs the entire line. 

# 14a.) What you get is the lines that I commented out initially as a header, but they have square brackets with a single quote inside, the contents of what I commented out, and "\n". It's reading the lines and showing line breaks as well. 

# 14b.) What I noticed when I added the second print statement for .readlines(1), it showed more of the contents of the txt file and this time it added more lines within the script.

# 14c.) What i noticed when added the first .readlines(10) is that it prints ten characters of each line with brackets around the words. 

# 14d.) I noticed that adding the second .readlines(10) adds more lines from the txt file and continues to keep the words within a square bracket.

# 14e.) What I get this time is the bottom half of the file when I use .readlines(100) and empty square brackets below it when using .readlines(-1).

# 15a.) When I use .read(50), I get the first 50 words, but one of the statements is cut off.

