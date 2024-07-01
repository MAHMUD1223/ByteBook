import csv
import sys


def main():

    # Checking for command-line usage
    db=sys.argv[1]
    tst=sys.argv[2]

    # Reading database file into a variable
    rows=[]
    with open(db, 'r') as file:
        data=csv.DictReader(file)
        for row in data:
            rows.append(row)

    # Reading DNA sequence file into a variable
    with open(tst, 'r') as dna_data:
        dna= dna_data.read()

    # Finding longest match of each STR in DNA sequence
    matching=[]
    seq=list(rows[1].keys())[1:]
    for k in seq:
        matching.append(longest_match(dna, k))

    #Checking database for matching profiles
    matched=False
    for j in rows:
        data_seq=[]
        for n in seq:
            data_seq.append(int(j[n]))
        if data_seq == matching:
            print(j['name'])
            matched=True
            break
    if not matched:
        print("No match")
    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
