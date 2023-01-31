import pyfiglet
list_a=["relief","ticks","starwars","speed","smslant","smscript","smkeyboard","smisome1","shadow","script","sblood","runyc","rowancap","rozzo","roman","rev","pyramid","poison","os2","nvscript","mirror","mini","maxfour","lean","larry3d","katakana","isometric1","isometric2","isometric3","isometric4","invita","graffiti","gradient","gothic","fraktur","fender","f15_____","eftitalic","eftirobot","double","doh","diamond","defleppard","cricket","cursive","contrast","caligraphy","calgphy2","broadway","bigchief","big","barbwire","banner3-D","banner4","arrows","alligator","alligator2","acrobatic","3-d"]
word= input("Your word: ")
for i in list_a:
    print(i+"\n")
    print(pyfiglet.figlet_format(word, font=i))