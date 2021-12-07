#!/bin/bash
#get the current logged in user and save to $loggedInUser variable
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#run the script as the current user to Enable New Outlook
#valid integers are:
#0 - Switch Hidden
#1 - Switched Displayed, default off
#2 - Switch Displayed, default on
#3 - New Outlook Enabled, switch hidden
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.microsoft.Outlook EnableNewOutlook -int 2
