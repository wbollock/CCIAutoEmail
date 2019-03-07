# CCIAutoEmail
Repo for a CCI HelpDesk auto email program. 

This program will send an email via ssmtp from the config setup at /etc/ssmtp/ssmtp.conf.

Then, it uses "at" to send a reminder email X days later.

Prequisites: at, ssmtp

## SSMTP setup
vim/emacs/nano /etc/ssmtp/ssmtp.conf

Enter mail server details, use MX records

No other setup required



### Config file for ssmtp sendmail


root=YourEmailHere

mailhub=smtp.gmail.com:465

rewriteDomain=gmail.com

AuthUser=Gmail_Username

AuthPass=PlainTextPassword!!!!

hostname=YourHostname

FromLineOverride=YES

UseTLS=YES
