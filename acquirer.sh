#sudo apt-get install figlet > /dev/null
#if ! [ $(id -u) = 0 ]; then
#	           echo "Run this script as Root "
#		                 exit 1
#fi
#figlet "  acquirer . sh  "
echo "         _                         _
    __ _  ___ __ _ _   _(_)_ __ ___ _ __       ___| |__
   / _` |/ __/ _` | | | | | '__/ _ \ '__|     / __| '_ \
  | (_| | (_| (_| | |_| | | | |  __/ |     _  \__ \ | | |
   \__,_|\___\__, |\__,_|_|_|  \___|_|    (_) |___/_| |_|
                |_| "
echo " By @albonycal
"
if [ -z "$1" ]
then
	echo "Usage: ./acquirer.sh <Domain Name>"                
	exit 1
fi

#echo " Updating Apt Repository... "
 #sudo apt-get install figlet nmap curl wget neofetch   > /dev/null

 #echo "
 #Installing Pakages... "
 #sleep 2s
 #echo " Installing nmap.. "
 #sleep 2s
 #echo " Installing curl.."
 #$FILE = ~/tools
 #if [ -f "$FILE" ]; then
 #           echo "$FILE already exists."
 #    else
 #               mkdir tools
 #fi


# printf "\n----- NMAP -----\n\n" > results

 #echo "Running Nmap..."
 #nmap $1 | tail -n +5 | head -n -3 >> results
 #cat results
 mkdir -p $1
 cd $1
 #starting sublist3r
 #sublist3r -d $1 -v -o domains.txt
 amass enum -passive -d $1 -src >> domains.txt
 #running assetfinder
 /home/albony/go/bin/assetfinder --subs-only $1 | tee -a domains.txt
 #removing duplicate entries
 sort -u domains.txt -o domains.txt
 #checking for alive domains
 echo "\n\n[+] Checking for alive domains..\n"
 cat domains.txt | /home/albony/go/bin/httprobe | tee -a alive.txt
 cat alive.txt | /home/albony/go/bin/hakrawler -plain  | tee -a xss_scan.txt
 cat xss_scan.txt | /home/albony/go/bin/kxss    | tee -a final_xss.txt
 
#Scanning Using httpx

#cat domains.txt | httpx -follow-redirects -silent | tee -a alive.txt
#formatting the data to json
 #cat alive.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > alive.json
 #cat domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > domains.json
