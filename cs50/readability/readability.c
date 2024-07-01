#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

void calculateLS(const char *text, double *L, double *S);

int main(void)
{
    char *text = get_string("Text: ");
    double L, S;
    calculateLS(text, &L, &S);
    double index = 0.0588 * L - 0.296 * S - 15.8;
    int rounded_index = round(index);
    if (rounded_index >= 16)
    {
        printf("Grade 16+\n");
    }
    else if (rounded_index < 1)
    {
        printf("Before Grade 1\n");
    }
    else
    {
        printf("Grade %d\n", rounded_index);
    }
    return 0;
}

void calculateLS(const char *text, double *L, double *S)
{
    int letters = 0, words = 0, sentences = 0, i = 0, inWord = 0;
    while (text[i] != '\0')
    {
        if (isalpha(text[i]))
        {
            letters++;
        }
        if (isspace(text[i]))
        {
            if (inWord)
            {
                words++;
                inWord = 0;
            }
        }
        else
        {
            inWord = 1;
        }
        if (text[i] == '.' || text[i] == '!' || text[i] == '?')
        {
            sentences++;
        }
        i++;
    }
    if (inWord)
    {
        words++;
    }
    if (words > 0)
    {
        *L = (letters / (double) words) * 100;
        *S = (sentences / (double) words) * 100;
    }
    else
    {
        *L = 0;
        *S = 0;
    }
}
