from cs50 import get_string
credit_number=get_string("Number: ")
crd_rev=credit_number[::-1]
sum=0
for i in range(len(credit_number)):
    if i%2!=0:
        add=int(crd_rev[i])*2
        if add>=10:
            sum+=add//10+(add%10)
        else:
            sum+=add
    else:
        sum+=int(crd_rev[i])
sum10=sum%10
crd_len=len(credit_number)
if sum10==0 and credit_number[:2] in ["34","37"] and crd_len==15:
    print("AMEX")
elif sum10==0 and credit_number[:1]=="4" and crd_len in [13, 16]:
    print("VISA")
elif sum10==0 and credit_number[:2] in ["51","52","53","54","55"] and crd_len==16:
    print("MASTERCARD")
else:
    print("INVALID")
