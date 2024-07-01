#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool is_valid_key(const char *str);

int main(int argv, char *argc[])
{
    if (argv != 2 || !is_valid_key(argc[1]))
    {
        printf("Usage: ./caeser key\n");
        return 1;
    }
    char *text = get_string("plaintext: ");
    char *cipher = malloc(strlen(text) * sizeof(text));
    int shift_key = atoi(argc[1]);
    for (int i = 0; text[i] != '\0'; i++)
    {
        char c = text[i];
        if (isupper(c))
        {
            cipher[i] = ((c - 'A' + shift_key) % 26) + 'A';
        }
        else if (islower(c))
        {
            cipher[i] = ((c - 'a' + shift_key) % 26) + 'a';
        }
        else
        {
            cipher[i] = c;
        }
    }
    printf("ciphertext: %s\n", cipher);
    free(cipher);
    return 0;
}

bool is_valid_key(const char *str)
{
    for (int i = 0; str[i] != '\0'; i++)
    {
        if (!isdigit(str[i]))
        {
            return false;
        }
    }
    return true;
}
