This repo contains my solution to the coding challenge.
## Repo Structure

 - bin - contains the code for building the cli app
 - lib - contains the code for each question in the challenge 
 - test - unit test for testing the functions in `lib`
## Usage
This project will produce a cli that accepts a command as the first argument. Each command will run my solution for each question in the coding challenge.

    Usage: driver <command> [arguments]
    
    Global options:
    -h, --help    Print this usage information.
    
    Available commands:
      mindenoms     Calculate min number of coins to total a specified amount
      palindromic   Determine if a string is a palindrom
    
    Run "driver help <command>" for more information about a command.
### palindromic
The palindromic command runs the solution for the first question.

    Determine if a string is a palindrom
    
    Usage: driver palindromic [arguments]
    -h, --help                      Print this usage information.
    -s, --subject (mandatory)       String to test
        --startRange (mandatory)    Start range of substring
        --endRange (mandatory)      End range of substring
    
    Run "driver help" to see global options.  
### mindenoms
The mindenoms command runs the solution to the second question.

    Calculate min number of coins to total a specified amount
    
    Usage: driver mindenoms [arguments]
    -h, --help                  Print this usage information.
    -c, --coins                 List of coins
    -a, --amount (mandatory)    Amount to test
    
    Run "driver help" to see global options.

## Dev
Before building the solution its dependencies must be fetched

    dart pub get

To run the solution's unit test run the following command from the root directory of the solutions repo

    dart test
To build the solutions executable run the following command from the root directory of the solutions repo

    dart compile exe bin/driver.dart -o driver
