'''
import os
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
age(*det)

#   **kwargs
def mark(**kwargs):
    for key, value in kwargs.items():
        print(f"{key} got {value} in math exam")

marklist= {"mahmud":100,"ariyan":97,"saad":95,"raj":93,"tasnim":91}

#        try, else, expect and finally

try:
    print("I will try to work")
    #open("this.txt", 'r')
except EOFError as e:
    print("we can handle this error if try has EOFError we con use multiple of them")
else:
    print("This will do when there will no expect ran")
finally:
    print("This will be printed weather try or expect work or not")



#   Iterable, Itertor, Iteration
def gen(n):
    for i in range(n):
        yield i      # this will hold the value of this

#                  list comprehensions, dict comprehensions, set comprehensions and genarator comprehensions
#list comp
list_1=[1,32,4,5,66,78,4,3,7,15,30,46,90,57]
print([item for item in list_1 if item%3==0])
# dict comp
dict1 = {'a':45,'b':65,'A':5}
print({k.lower():dict1.get(k.lower(), 0)+dict1.get(k.upper(),0) for k in dict1.keys()})
#set comp
square={x**2 for x in [1,2,3,4,5,6,7,8,9]}
print(square)
gen = (i for i in range(56) if i%3==0)
for item in gen:
    print(item)
'''
