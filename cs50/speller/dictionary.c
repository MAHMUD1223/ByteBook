// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "dictionary.h"

// custom string case insensetive function
int strcmp_custom(const char *s1, const char *s2);

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// Choose number of buckets in hash table
const unsigned int N = 10000; // Increased for better distribution

// Hash table
node *table[N];

// Number of words in dictionary
unsigned int word_count = 0;

// Returns true if word is in dictionary, else false
bool check(const char *word)
{

    unsigned int hash_value = hash(word);


    node *cursor = table[hash_value];


    while (cursor != NULL)
    {
        if (strcmp_custom(cursor->word, word) == 0)
        {
            return true;
        }
        cursor = cursor->next;
    }


    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{

    unsigned long hash = 5381;
    int c;

    while ((c = *word++))
    {
        hash = ((hash << 5) + hash) + tolower(c);
    }

    return hash % N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{

    FILE *file = fopen(dictionary, "r");
    if (file == NULL)
    {
        return false;
    }


    char word[LENGTH + 1];


    while (fscanf(file, "%45s", word) != EOF)
    {

        node *new_node = malloc(sizeof(node));
        if (new_node == NULL)
        {
            return false;
        }


        strcpy(new_node->word, word);
        new_node->next = NULL;


        unsigned int hash_value = hash(word);


        new_node->next = table[hash_value];
        table[hash_value] = new_node;


        word_count++;
    }

    fclose(file);

    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    return word_count;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{

    for (unsigned int i = 0; i < N; i++)
    {
        node *cursor = table[i];
        while (cursor != NULL)
        {
            node *temp = cursor;
            cursor = cursor->next;
            free(temp);
        }
    }

    return true;
}

int strcmp_custom(const char *s1, const char *s2)
{
    while (*s1 && *s2)
    {
        char c1 = tolower((unsigned char)*s1);
        char c2 = tolower((unsigned char)*s2);
        if (c1 != c2)
        {
            return c1 - c2;
        }
        s1++;
        s2++;
    }
    return tolower((unsigned char)*s1) - tolower((unsigned char)*s2);
}

