# First install figlet using sudo apt-get install figlet 
figlet "  acquirer . sh  "
echo " By @albonycal
"
if [ -z "$1" ]
then
	echo "Usage: ./acquirer.sh <Domain Name>"                
	exit 1
fi

#sudo -E apt-get install figlet > /dev/null
2
#if ! [ $(id -u) = 0 ]; then
3
#                  echo "Run this script as Root "
4
#                                exit 1
5
#fi
6
figlet "  acquirer . sh  "
7
echo " By @albonycal
8
"
9
if [ -z "$1" ]
10
then
11
        echo "Usage: ./acquirer.sh <Domain Name>"                
12
        exit 1
13
fi
14
​
15
#echo " Updating Apt Repository... "
16
 #sudo apt-get install figlet nmap curl wget neofetch   > /dev/null
17
​
18
 #echo "
19
 #Installing Pakages... "
20
 #sleep 2s
21
 #echo " Installing nmap.. "
22
 #sleep 2s
23
 #echo " Installing curl.."
24
 #$FILE = ~/tools
25
 #if [ -f "$FILE" ]; then
26
 #           echo "$FILE already exists."
27
 #    else
28
 #               mkdir tools
29
 #fi
30
​
31
​
32
# printf "\n----- NMAP -----\n\n" > results
33
​
34
 #echo "Running Nmap..."
35
 #nmap $1 | tail -n +5 | head -n -3 >> results
36
 #cat results
37
 mkdir -p $1
38
 cd $1
39
 #starting sublist3r
40
 #sublist3r -d $1 -v -o domains.txt
41
 amass enum -passive -d $1 -src >> domains.txt
42
 #running assetfinder
43
 $HOME/go/bin/assetfinder --subs-only $1 | tee -a domains.txt
44
 #removing duplicate entries
45
 sort -u domains.txt -o domains.txt
46
 #checking for alive domains
47
 echo "\n\n[+] Checking for alive domains..\n"
48
 cat domains.txt | $HOME/go/bin/httprobe | tee -a alive.txt
49
 cat alive.txt | $HOMEgo/bin/hakrawler -plain  | tee -a xss_scan.txt
50
 cat xss_scan.txt | $HOME/go/bin/kxss    | tee -a final_xss.txt
51
 
52
#Scanning Using httpx
53
​
54
#cat domains.txt | httpx -follow-redirects -silent | tee -a alive.txt
55
#formatting the data to json
56
 #cat alive.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > alive.json
57
 #cat domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > domains.json


 mkdir -p $1
 cd $1
 #starting sublist3r
 #sublist3r -d $1 -v -o domains.txt
 amass enum -passive -o domain.txt -config ~/.config/amass/config.ini  -d $1 
 #running assetfinder
 $HOME/go/bin/assetfinder --subs-only $1 | tee -a domain.txt
 #removing duplicate entries
 sort -u domain.txt -o domain.txt
 #Notify-To-Discord DOMAINS
 echo " [+] SUB-DOMAINS of $1 [+] " | notify
 #Adding http to the domains 
 sed -E 's/^/http:\/\//g' domain.txt &> domains.txt

 #checking for alive domains
 echo "[+] Checking for alive domains.." | notify
 cat domains.txt | httpx -follow-redirects -silent | tee -a alive.txt
 #NOTIFY_TO_DISCORD ALIVE
 cat alive.txt | notify
 #cat domains.txt | $HOME/go/bin/httprobe | tee -a alive.txt
 #cat alive.txt | $HOME/go/bin/hakrawler -plain  | tee -a crawler.txt
 #cat crawler.txt | $HOME/go/bin/kxss    | tee -a xss.txt
 #Running Acquirer_Aquatone
 echo "[+] Generating Report.." | notify
 cat alive.txt | acquirer_aquatone -ports medium -silent -template-path ~/acquirer_aquatone/static/report_template.html 
#XSS
#cat xss.txt

#cat domains.txt | httpx -follow-redirects -silent | tee -a alive.txt
#formatting the data to json
 #cat alive.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > alive.json
 #cat domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > domains.json
