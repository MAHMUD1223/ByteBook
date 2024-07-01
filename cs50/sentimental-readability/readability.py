from cs50 import get_string


def calculateLS(text):
    letters = 0
    words = 0
    sentences = 0
    in_word = False

    for char in text:
        if char.isalpha():
            letters += 1
        if char.isspace():
            if in_word:
                words += 1
                in_word = False
        else:
            in_word = True
        if char in ['.', '!', '?']:
            sentences += 1

    if in_word:
        words += 1

    if words > 0:
        L = (letters / words) * 100
        S = (sentences / words) * 100
    else:
        L = 0
        S = 0

    return L, S


text = get_string("Text: ")
L, S = calculateLS(text)
index = 0.0588 * L - 0.296 * S - 15.8
rounded_index = round(index)

if rounded_index >= 16:
    print("Grade 16+")
elif rounded_index < 1:
    print("Before Grade 1")
else:
    print(f"Grade {rounded_index}")
