#!/bin/bash
# Authors : Kevin Lee
# Date: 2/1/2019

#Problem 1 Code:
#Make sure to document how you are solving each problem!

# 1. Accept a regular expression & file name from the user with a prompt
echo "Enter in a regular expression: "
read expression
echo "Enter in a file name: "
read filename

# 2. Feed the user's regular expression into grep and run into their chosen file
grep $expression $filename

echo "Step 2 Complete, Initiating Step 3: "
# 3. Hardcode some grep command calls which will:

# 3.1. Count the number of phone numbers in regex_practice.txt
	# Will search regex_practice.txt for 3 digits (ranging from 0 to 9) followed by a dash, then 3 more
	# digits (ranging from 0 and 9) and another dash, and lastly ending with 4 digits (ranging from 0 to 9)
	# -c grep is used to find the count
echo "The number of phone numbers in the file is: "
grep -E -c [0-9]{3}-[0-9]{3}-[0-9]{4} regex_practice.txt

# 3.2. Count the number of emails in regex_practice.txt
	# Will search regex_practice.txt for anything that is any word or number combination (0 to 9, a to z, or A to Z)
	# and followed by the @ symbol, then proceeding with anything other combination (0 to 9, a to z, or A to Z) 
	# and finally ending with ".com"
echo "The number of emails in the file is: "
grep -E -c [0-9a-zA-Z]+@[0-9a-zA-Z]+".com" regex_practice.txt

# 3.3. List all of the phone numbers in the "303" area code and store the results in "phone_result.txt"
	# Will search regex_practice.txt for all lines that begin with the digits/area code 303
	# followed by a dash, 3 more digits (ranging from 0 to 9), another dash, and ending with 4 digits (ranging from 0 to 9)
	# this then stores the results (all numbers with area code "303")  into a new file called phone_results.txt
grep -E "303-"[0-9]{3}-[0-9]{4} regex_practice.txt > phone_results.txt

# 3.4. List all the emails NOT from geocities.com and store the results in "email_result.txt"
	# Selects all non matching lines of the phrase "geocities" from regex_practice.txt and stores them in a temporary
	# file called temp.txt. After storing all the lines that don't contain geocities in them, it checks the file to
	# remove lines that are not in email format. Once doing so, the result will be saved into email_result.txt and the
	# temporary file temp.txt will be deleted as it is no longer needed.
grep -E -v "geocities" regex_practice.txt > temp.txt && grep "^.*@.*\.com" temp.txt > email_result.txt && rm -r temp.txt


# 3.5. List all of the lines that match a command-line regular expression and stores the result in "command_result.txt"
	# Finds all the lines in the filename entered as a command line argument  that contain the expression which was also 
	# entered as a command line arguement stores them into a new file called "command_result.txt"
	# command_results.txt
grep -E $expression $filename > command_results.txt
