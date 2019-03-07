#!/bin/bash
#CCI Automatic Email Program
#********************************************************************
# Written by Will Bollock
#This program will send an email via ssmtp from the config setup at 
# /etc/ssmtp/ssmtp.conf
#then, it uses "at" to send a reminder email X days later
#********************************************************************



#accept user input of a recepient Email
echo "Please enter the recipient email: "
read -r recepEmail

#accept the string of what to cable to remind user of
echo "Please enter the name of the cable you'd like to remind them of: "
read -r cableToLoan


#accept amount of days later to remind user, again
echo "Finally, enter the number of days until they recieve an automated reminder."
read -r timeLoan
 
message="Hello, this is an automated email from the CCI HelpDesk. Our records show you have loaned
$cableToLoan. Please return it within $timeLoan day(s). You will be get a reminder on the due date."
 
#sed to get rid of spaces for the file name below
cableNoSpaces=$(echo "$cableToLoan" | sed 's/ //g')

ssmtp "$recepEmail" <<< "$message"
fileName="${recepEmail}_${cableNoSpaces}_${timeLoan}.sh"


# create new file with message just sent, in order to avoid sh/bash conflict
# if you dont use bash "fileName" then it will run with SH instead of BASH
# because "at" has POSIX compliance, or something
touch "$fileName";
echo -e "#!/bin/bash" > "$fileName"
echo "ssmtp $recepEmail <<< \"$message\"" >> "$fileName"



# now run at job on file w/ code
#TODO: change to days once done testing
echo "bash $fileName" | at now + 1 minute