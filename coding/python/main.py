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
#          map function_to apply and list of inputs
def squre(n):
    return n**2
h1 = [1,3,5,7,9,11,13]
sq = list(map(squre, h1))
print(sq)

# filter funchion
def dived_by_2(n):
    extra = n % 2
    if extra == 0 :
        return True
    else:
        return False
li = [1,2,3,9,6,8,28,56,35,72,672]
div_by2=list(filter(dived_by_2, li))
print(div_by2)
'''
# reduce function
from functools import reduce

def sum_num(a, b):
    return a+b
li1 = reduce(sum_num, [1,2,3,4])
print(li1)
