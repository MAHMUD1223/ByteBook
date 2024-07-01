#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool is_char_list(const char *key);

int main(int argc, char *argv[])
{
    if (argc != 2 || !is_char_list(argv[1]))
    {
        printf("Usage: ./substitution key\n");
        return 1;
    }
    else if (strlen(argv[1]) != 26)
    {
        printf("Key must contain 26 characters.\n");
        return 1;
    }
    char cipher_dict[128] = {0};
    for (int i = 0; i < 26; i++)
    {
        char upletter = toupper(argv[1][i]);
        char lowletter = tolower(argv[1][i]);
        cipher_dict['A' + i] = upletter;
        cipher_dict['a' + i] = lowletter;
    }
    char *text = get_string("plaintext: ");
    char *cipher_text = malloc(strlen(text) * sizeof(char));
    for (int j = 0, len = strlen(text); j < len; j++)
    {
        if (isalpha(text[j]))
        {
            char letter = cipher_dict[(int) text[j]];
            cipher_text[j] = letter;
        }
        else
        {
            cipher_text[j] = text[j];
        }
    }

    printf("ciphertext: %s\n", cipher_text);
    return 0;
}

bool is_char_list(const char *key)
{
    bool seen[26] = {false};
    for (int i = 0; i < 26; i++)
    {
        if (!isalpha(key[i]))
        {
            return false;
        }
        int index = toupper(key[i]) - 'A';
        if (seen[index])
        {
            return false;
        }
        seen[index] = true;
    }
    return true;
}
