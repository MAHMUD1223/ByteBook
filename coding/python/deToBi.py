decimal0 = input("Your number: ")
decimal1 = float(decimal0)
decimal = int(decimal1)

def fo2bi(n):
    init = int(n)
    dec = n-init
    dig_c=0
    no_li=[]
    while dig_c<5:
        dec=dec*2
        dig_c+=1
        if dec > 0 and dec<1:
            no_li.append(0)
        elif dec >1 :
            dec=dec-1
            no_li.append(1)
    return no_li
def de2bi(n):
    dec=n
    bi=['.']
    while dec>0:
        las= dec/2
        bina = dec%2
        bins = str(bina)
        las=int(las)
        dec = las
        bi.append(bins)
    new= list(reversed(bi))
    return new#.reverse()
binary=de2bi(decimal)
float_binary=fo2bi(decimal1)
bi_st=""
num=0
num2 = 0
for i in binary:
    if num == 4:
        bi_st+=" "+i
        num=0
    else:
        bi_st+=i
        num+=1
for i in float_binary:
    if num2 == 4:
        num = str(i)
        bi_st+=" "+num
    else:
        num = str(i)
        bi_st+=num
        num2+=1

print(bi_st)
