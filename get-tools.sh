#!/bin/bash


#Installing Tools


echo " ::: Installing Tools ::: " 

#Installing Interlace 

#git clone https://github.com/codingo/Interlace

#cd Interlace ; python3 setup.py install

interlace --silent -tL gotools.txt   -threads 20 -c "go get github.com_target_"

#go-tools
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/intercept
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...
GO111MODULE=on go get -u -v github.com/lc/gau
GO111MODULE=on go get -u -v github.com/hahwul/dalfox
GO111MODULE=on go get -u github.com/sw33tLie/bbscope
#python3-pip
#pip3 install name-that-hash

