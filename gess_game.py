import random
import sys
from time import sleep
import pyfiglet
speed = 0.0015
def print(words):
    for char in words:
        sleep(speed)
        sys.stdout.write(char)
        sys.stdout.flush()
while True:
     try:
         print(pyfiglet.figlet_format("Gess",font="slant"))
         print(pyfiglet.figlet_format("      GAME"))
         print("Gess a number in 1 to 10\nYou will have 9 gess to find the right number\n")
         gess_ans=random.randint(1,10)
         gess_time=1
         gess_limit=10
         g_list=[]
         while True:
             a=input(f"Your {gess_time} gess : ")
             a=int(a)
             gess_time+= 1
             if a>10 or a<1:
                 gess_time-=1
                 print("\033[1;31mERROR:You can only type number from 1 to 10\n\033[1;00m")
             elif gess_time==10:
                print("\033[1;31mYou've failed to complete the callange.")
                print(f"The correct ans was '{gess_ans}'\033[1;0m")
                break
             elif gess_ans!=a and gess_time<gess_limit:
                if a in g_list:
                   gess_time-=1
                   print(f"\n\033[1;35mWhat are you gonna use '{a}' again???\nAre you a")
                   print(" fool???\nI am gonna give you another chance don't do this again.\n\033[1;00m")
                else:
                   g_list.append(a)
                   gess_left=gess_limit-gess_time
                   print(f"\033[1;36mYou gess is worng!\n You have {gess_left} gess left\033[1;00m\n")
             elif gess_ans == a:
                 print("\033[1;32m")
                 gess_time-=2
                 gess_tim =gess_time+1
                 gess_p=100-(gess_time*10)
                 print(f"You've won!\nYou've in your {gess_tim} gess and your point is {gess_p}\033[1;00m")
                 break
                    
     except ValueError:
        print("\033[1;31mERROR: The ans must be in number\033[1;00m")
     con=input("\nWanna play again?(y or n)")
     end=pyfiglet.figlet_format("Mahmud",font="banner3-D")
     if con in ('Y', 'y'):
            pass
     elif con in ('N','n'):
            print("\nThank you for playing my game.\n\n                  Devloped by\n"+end)
            break
     else:
         print("\n\033[1;31mWhat are you typing??? I asked if you want to challange again.Just type y or n.\n Ok l will take this as a no\033[1;00m")
         print("\nThank you for playing my game.\n\n                  Devloped by\n"+end)
         break
         
        