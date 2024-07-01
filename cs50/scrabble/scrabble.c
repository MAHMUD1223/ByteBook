#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    int letterval[128];
    letterval['A'] = 1;
    letterval['B'] = 3;
    letterval['C'] = 3;
    letterval['D'] = 2;
    letterval['E'] = 1;
    letterval['F'] = 4;
    letterval['G'] = 2;
    letterval['H'] = 4;
    letterval['I'] = 1;
    letterval['J'] = 8;
    letterval['K'] = 5;
    letterval['L'] = 1;
    letterval['M'] = 3;
    letterval['N'] = 1;
    letterval['O'] = 1;
    letterval['P'] = 3;
    letterval['Q'] = 10;
    letterval['R'] = 1;
    letterval['S'] = 1;
    letterval['T'] = 1;
    letterval['U'] = 1;
    letterval['V'] = 4;
    letterval['W'] = 4;
    letterval['X'] = 8;
    letterval['Y'] = 4;
    letterval['Z'] = 10;
    char *player1_in = get_string("Player 1: ");
    char *player2_in = get_string("Player 2: ");
    int player1_score = 0, player2_score = 0;
    for (int i = 0, p1_len = strlen(player1_in); i < p1_len; i++)
    {
        char upper = toupper(player1_in[i]);
        if (upper >= 'A' && upper <= 'Z')
        {
            player1_score += letterval[(int) upper];
        }
    }
    for (int i = 0, p2_len = strlen(player2_in); i < p2_len; i++)
    {
        char upper = toupper(player2_in[i]);
        if (upper >= 'A' && upper <= 'Z')
        {
            player2_score += letterval[(int) upper];
        }
    }
    if (player1_score == player2_score)
    {
        printf("Tie!\n");
    }
    else if (player1_score > player2_score)
    {
        printf("Player 1 wins!\n");
    }
    else
    {
        printf("Player 2 wins!\n");
    }
    return 0;
}
