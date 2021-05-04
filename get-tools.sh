#!/bin/bash
# MADE BY ALBONYCAL

#Installing Tools


echo " ::: Installing Tools ::: " 

#Installing Interlace 

#git clone https://github.com/codingo/Interlace

#cd Interlace ; python3 setup.py install

interlace --silent -tL gotools.txt   -threads 20 -c "go get github.com_target_"

#go-tools
go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
go get -v github.com/projectdiscovery/notify/cmd/notify
go get -v github.com/projectdiscovery/notify/cmd/intercept
go get -v github.com/projectdiscovery/httpx/cmd/httpx
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
go get -v github.com/OWASP/Amass/v3/...
go get -u -v github.com/lc/gau
go get -u -v github.com/hahwul/dalfox
go get -u github.com/sw33tLie/bbscope
#python3-pip
#pip3 install name-that-hash

