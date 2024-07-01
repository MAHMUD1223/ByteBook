from cs50 import get_int

height=get_int("Height: ")

while(height<1 or height>8):
    height=get_int("Height: ")
i=1
n=height
while(i<=height):
    print(" "*(n-i)+"#"*i)
    i+=1
