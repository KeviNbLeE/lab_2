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
	# Will search regex_practice.txt for 3 digits followed by a dash, then 3 more digits and another dash,
	# and lastly ending with 4 digits
echo "The number of phone numbers in the file is: "
grep -E -c [0-9]{3}-[0-9]{3}-[0-9]{4} regex_practice.txt

# 3.2. Count the number of emails in regex_practice.txt
	# Will search regex_practice.txt for anything that is followed by the @ symbol,
	# then proceeding with anything else and ending with ".com"
echo "The number of emails in the file is: "
grep -E -c [0-9a-zA-Z]+@[0-9a-zA-Z]+".com" regex_practice.txt

# 3.3. List all of the phone numbers in the "303" area code and store the results in "phone_result.txt"
	# Will search regex_practice.txt for all lines that begin with the digits/area code 303
	# followed by a dash, 3 more digits, another dash, and ending with 4 digits
	# this then stores the results (all numbers with area code "303")  into a new file called phone_results.txt
grep -E "303-"[0-9]{3}-[0-9]{4} regex_practice.txt > phone_results.txt

#NEEDS WORK (DID OPPOSITE WITH STORING EMAILS FROM geocities INSTEAD OF OTHERWAY
# 3.4. List all the emails NOT from geocities.com and store the results in "email_result.txt"
	# Wil search regex_practice.txt for all lines that contain the string
	# geocities.com since these are the lines containing the email addresses we
	# care about and outputting them to a new file email_results.txt
#grep -E -v "geocities.com" regex_practice.txt > email_results.txt
grep -E -v "geocities" regex_practice.txt > temp.txt && grep "^.*@.*\.com" temp.txt > email_result.txt && rm -r temp.txt


# 3.5. List all of the lines that match a command-line regular expression and stores the result in "command_result.txt"
	# Finidng all lines in the file that contain exactly two letters regardless
	# of case followed by exactly 2 numbers and outputting them to a new file
	# command_results.txt
grep -E $expression $filename > command_results.txt
