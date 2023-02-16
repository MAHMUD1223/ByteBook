'''import os
def main():
    print(os.listdir("/workspaces/haval"))
if __name__=="__main__":
    main()

def mostImportant():
    print("I am supream emparor")

#*args and **kwargs
#*vars and **kvars

#    *args
def age(*args):
    if len(args)==3:
        print(f"{args[0]} is {args[1]} year old and roll no is {args[2]}")
    else:
        print(f"hello {args[0]}")
det=["mahmud", 19, 1]
age(*det)'''

#   **kwargs
def mark(**kwargs):
    for key, value in kwargs.items():
        print(f"{key} got {value} in math exam")

marklist= ["mahmud":"100"]

