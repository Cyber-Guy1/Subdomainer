#!/bin/bash

cat <<"EOF"

  _________    ___.        .___                    .__                     
 /   _____/__ _\_ |__    __| _/____   _____ _____  |__| ____   ___________ 
 \_____  \|  |  \ __ \  / __ |/  _ \ /     \\__  \ |  |/    \_/ __ \_  __ \
 /        \  |  / \_\ \/ /_/ (  <_> )  Y Y  \/ __ \|  |   |  \  ___/|  | \/
/_______  /____/|___  /\____ |\____/|__|_|  (____  /__|___|  /\___  >__|   
        \/          \/      \/            \/     \/        \/     \/       

        Automated Subdomain Gathering Tool
          Developed By Momen Ali
              The Cyber Guy

         _           _        _ _ 
        (_)_ __  ___| |_ __ _| | |
        | | '_ \/ __| __/ _` | | |
        | | | | \__ \ || (_| | | |
        |_|_| |_|___/\__\__,_|_|_|

EOF

# Create a function to print section separators
section() {
  printf "\n\n\e[92m=============================================\e[0m"
  printf "\n\n\e[92m%s\e[0m" "$1"
  printf "\n\n\e[92m=============================================\e[0m\n\n"
}

# Create and change to the Tools directory
mkdir -p Tools
cd Tools || { echo "Error: Unable to change to Tools directory."; exit 1; }

# Update repositories
section "Updating Repos"
sudo apt update

# Install Git
section "Installing Git"
sudo apt -y install git

# Install Python3
section "Installing Python3"
sudo apt -y install python3

# Install PIP3
section "Installing PIP3"
sudo apt -y install python3-pip

# Install Python2 (not available in Ubuntu 24.04, use python-is-python2 or skip)
section "Installing Python2"
sudo apt -y install python-is-python2 || echo "Python2 not available, continuing..."

# Install Golang
section "Installing Golang"
sudo apt -y install golang

# Install additional packages
section "Installing Additional Packages"
sudo apt -y install libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev build-essential libssl-dev libffi-dev python3-dev libldns-dev jq ruby-full python3-setuptools python3-dnspython rename findutils

# Install Sublist3r
section "Sublist3r Installing"
git clone https://github.com/thetowsif/Sublist3r.git
cd Sublist3r/ || { echo "Error: Unable to change to Sublist3r directory."; exit 1; }
# Create virtual environment to avoid externally-managed-environment error
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
deactivate
cd ../ || { echo "Error: Unable to return to the parent directory."; exit 1; }

# Install Github-Search
section "Github-Search Installing"
git clone https://github.com/gwen001/github-search.git

# Install Knockpy
section "Knockpy Installing"
git clone https://github.com/guelfoweb/knock.git
cd knock || { echo "Error: Unable to change to knock directory."; exit 1; }
# Install using pip with --break-system-packages flag
pip3 install --break-system-packages .
cd ../ || { echo "Error: Unable to return to the parent directory."; exit 1; }

# Install additional tools
section "Installing Additional Subdomain Tools"

# Install Subfinder
section "Installing Subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Assetfinder
section "Installing Assetfinder"
go install -v github.com/tomnomnom/assetfinder@latest

# Install Amass
section "Installing Amass"
go install -v github.com/owasp-amass/amass/v3/...@master

# Install Findomain
section "Installing Findomain"
wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
sudo mv findomain-linux /usr/local/bin/findomain

# Install shuffledns
section "Installing shuffledns"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest

# Install gau
section "Installing gau"
go install github.com/lc/gau/v2/cmd/gau@latest

# Install waybackurls
section "Installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest

# Install httpx
section "Installing httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

section "Installation Completed!"
echo "All tools have been installed. Please add GOPATH to your PATH:"
echo "export PATH=\$PATH:\$(go env GOPATH)/bin"