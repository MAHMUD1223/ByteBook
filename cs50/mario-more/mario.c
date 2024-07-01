#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int num;
    do
    {
        num = get_int("Height: ");
    }
    while (num <= 0);
    for (int i = 1; i <= num; i++)
    {
        for (int k = num; k > i; k--)
        {
            printf(" ");
        }
        for (int j = 0; j < i; j++)
        {
            printf("#");
        }
        printf("  ");
        for (int l = 0; l < i; l++)
        { 
            printf("#");
        }
        printf("\n");
    }
    return 0;
}
