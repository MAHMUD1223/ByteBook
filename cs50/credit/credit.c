#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    long credit_num = get_long("Number: ");
    char crdt[16];
    sprintf(crdt, "%ld", credit_num);
    int sum = 0;
    int len = strlen(crdt);
    for (int i = len - 1, j = 0; i >= 0; i--, j++)
    {
        int digit = crdt[i] - 48;
        if (j % 2 == 1)
        {
            int sumadder = digit * 2;
            if (sumadder >= 10)
            {
                sum += sumadder % 10 + sumadder / 10;
            }
            else
            {
                sum += sumadder;
            }
        }
        else
        {
            sum += digit;
        }
    }
    int digit = crdt[0] - 48;
    if (digit == 4 && sum % 10 == 0 && (len == 16 || len == 13))
    {
        printf("VISA\n");
        return 0;
    }
    digit *= 10;
    digit += crdt[1] - 48;

    if ((digit == 34 || digit == 37) && sum % 10 == 0 && len == 15)
    {

        printf("AMEX\n");
        return 0;
    }
    else if ((digit == 51 || digit == 52 || digit == 53 || digit == 54 || digit == 55) &&
             sum % 10 == 0 && len == 16)
    {
        printf("MASTERCARD\n");
        return 0;
    }
    else
    {
        printf("INVALID\n");
    }
    return 0;
}
