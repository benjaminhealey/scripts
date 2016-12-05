: <<'ABOUT'
This is a simple program I made for when I am tryng to update where a domain name points. 
the TTL for some services is shotty and this script notifies me when a URL points to a 
different domain then it did when the script was started. 
ABOUT
#! /bin/bash
now=$(date)
echo $now
echo "input URL (ex. www.google.ca)"; read webSite
ipOrig=$(nslookup $webSite)  #get info for nslookup
ipOrigClean=${ipOrig##*Address: } #strip to last server address
while true; do
ipNew=$(nslookup $webSite)  #get info for nslookup
ipNewClean=${ipOrig##*Address: } #strip to last server address
if [ "$ipNewClean" != "$ipOrigClean" ]; then #check for changes
  #alert
  osascript -e 'tell app "System Events" to display dialog "'$webSite' is now at '$ipNewClean'"'
  break
fi
sleep 300 #5 min repeat cycle
done
echo $ipOrigClean 
