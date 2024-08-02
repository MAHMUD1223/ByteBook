import argparse
from sys import argv

def main():
    parser = argparse.ArgumentParser(description="A script to demonstrate command-line arguments.")
    
    # Adding the -p flag which expects a string value
    parser.add_argument('-p', '--print', type=str, help='Print the provided text.')

    # Adding the -v flag which doesn't expect a value (a boolean flag)
    parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose mode.')

    args = parser.parse_args()

    # Handling the -p flag
    if args.print:
        print(f"Text to print: {args.print}")
    
    # Handling the -v flag
    if args.verbose:
        print("Verbose mode enabled.")
    # Taking normal positional argument
    if argv[1]:
      print(argv[1])
      # will print out the first input after script name

if __name__ == "__main__":
    main()
