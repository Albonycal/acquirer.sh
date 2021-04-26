# First install figlet using sudo apt-get install figlet 
figlet "  acquirer . sh  "
echo " By @albonycal
"
if [ -z "$1" ]
then
        echo "Usage: ./acquirer.sh <Domain Name>"                
        exit 1
fi

mkdir -p $1
 cd $1
 amass enum -passive -d $1 -src >> domains.txt
 #running assetfinder
 $HOME/go/bin/assetfinder --subs-only $1 | tee -a domains.txt
 #removing duplicate entries
 sort -u domains.txt -o domains.txt
 #checking for alive domains
 echo "\n\n[+] Checking for alive domains..\n"
 cat domains.txt | $HOME/go/bin/httprobe | tee -a alive.txt
 cat alive.txt | $HOMEgo/bin/hakrawler -plain  | tee -a xss_scan.txt
 cat xss_scan.txt | $HOME/go/bin/kxss    | tee -a final_xss.txt
 
#Scanning Using httpx
#cat domains.txt | httpx -follow-redirects -silent | tee -a alive.txt
 mkdir -p $1
 cd $1
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
# cat alive.txt | notify
 #cat domains.txt | $HOME/go/bin/httprobe | tee -a alive.txt
 #cat alive.txt | $HOME/go/bin/hakrawler -plain  | tee -a crawler.txt
 #cat crawler.txt | $HOME/go/bin/kxss    | tee -a xss.txt
 #Running Acquirer_Aquatone
 echo "[+] Generating Report.." | notify
 cat alive.txt | acquirer_aquatone -ports medium -silent -template-path ~/acquirer_aquatone/static/report_template.html 

#cat domains.txt | httpx -follow-redirects -silent | tee -a alive.txt
