#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int money, change = 0;
    do
    {
        money = get_int("Change owed: ");
    }
    while (money <= 0);

    while (money != 0)
    {
        if (money >= 25)
        {
            money -= 25;
            change++;
        }
        else if (money >= 10)
        {
            money -= 10;
            change++;
        }
        else if (money >= 5)
        {
            money -= 5;
            change++;
        }
        else if (money >= 1)
        {
            money -= 1;
            change++;
        }
    }
    printf("%d\n", change);
    return 0;
}
