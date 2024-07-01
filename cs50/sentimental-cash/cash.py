from cs50 import get_float

cent = int(get_float("Change: ")*100)
while cent<0:
    cent = int(get_float("Change: ")*100)
owned=0
while cent!=0:
    if cent>=25:
        owned+=cent//25
        cent=cent%25
    elif cent>=10:
        owned+=cent//10
        cent=cent%10
    elif cent>=5:
        owned+=cent//5
        cent=cent%5
    else:
        owned+=cent
        cent=0
print(owned)
