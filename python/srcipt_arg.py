import argparse
from sys import argv

def main():
    parser = argparse.ArgumentParser(description="A script to demonstrate command-line arguments.")
    # making group for conflecting args
    group = parser.add_mutually_exclusive_group()
    
    # Adding the -p flag which expects a string value
    parser.add_argument('-p', '--print', type=str, help='Print the provided text.')

    # Adding the -v flag which doesn't expect a value (a boolean flag)
    group.add_argument('-v', '--verbose', action='store_true', help='Enable verbose mode.') 
    # opposite of verbose
    group.add_argument('-s', '--silence', action='store_true', help="Enable silent mode.")

    '''
    Suggestions:
    add `required=True` to force user to input this flag
    add `default=some_thing` to give a default value for user also need `nargs="?"` for one argument
    '''

    
    # adding only options value
    parser.add_argument('-l', '--level', type=int, choices=[1,2,3,4], help="Select your level")

    # countiong flags
    parser.add_argument('-m', '--moment', help="use -mm for more moment", action="count")

    args = parser.parse_args()

    # Handling the -p flag
    if args.print:
        print(f"Text to print: {args.print}")
    
    # Handling the -v flag
    if args.verbose:
        print("Verbose mode enabled.")

    # Handeling -m flag
    # using if else
    if args.moment==1:
        print("One moment")
    elif args.moment==2:
        print("Two moment")
    else:
        print("default moment")
    # using match
    match args.moment:
        case 1:
            print("One moment")
        case 2:
            print("Two moment")
        case _:
            print("Default moment")




    
    # Just another way not reccomended
    # Taking normal positional argument
    if argv[1]:
      print(argv[1])
      # will print out the first input after script name

if __name__ == "__main__":
    main()
