# CCIAutoEmail
Repo for a CCI HelpDesk auto email program. 
Prequisites: at, ssmtp

## SSMTP setup
vim/emacs/nano /etc/ssmtp/ssmtp.conf
Enter mail server details, use MX records
No other setup required


### Config file for ssmtp sendmail


root=wbollockdev@gmail.com
mailhub=smtp.gmail.com:465
rewriteDomain=gmail.com
AuthUser=Gmail_Username
AuthPass=PlainTextPassword!!!!
hostname=YourHostname
FromLineOverride=YES
UseTLS=YES