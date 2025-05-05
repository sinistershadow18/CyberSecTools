#! /usr/bin/env bash


echo "Cyber Security tools installation script"


if [[ $EUID -ne 0 ]]; then
  echo "You need to be SUDO to execute this script."
  exit 1
fi

apt update

echo "Installing Osint tools"


# Installe SpiderFoot
echo "[*] Installation de SpiderFoot..."
apt install -y spiderfoot &> /dev/null

# Installe theHarvester
echo "[*] Installation de theHarvester..."
apt install -y theharvester &> /dev/null

# Installe Sherlock
echo "[*] Installation de Sherlock..."
git clone https://github.com/sherlock-project/sherlock.git /opt/sherlock
cd /opt/sherlock
pip3 install -r requirements.txt &> /dev/null

echo "End Osint"

echo "Installing Steg tools"

# Installe steghide
echo "[*] Installation de steghide..."
apt install -y steghide &> /dev/null

# Installe exiftool
echo "[*] Installation de exiftool..."
apt install -y libimage-exiftool-perl &> /dev/null

# Installe binwalk
echo "[*] Installation de binwalk..."
apt install -y binwalk &> /dev/null

# Installe zsteg (via Ruby)
echo "[*] Installation de zsteg..."
apt install -y ruby &> /dev/null
gem install zsteg &> /dev/null

# Installe foremost
echo "[*] Installation de foremost..."
apt install -y foremost &> /dev/null

# Installe strings (via binutils)
echo "[*] Installation de strings..."
apt install -y binutils &> /dev/null

# Téléchargement de stegsolve
echo "[*] Téléchargement de Stegsolve..."
mkdir -p /opt/stegtools
wget -q https://github.com/zardus/ctf-tools/raw/master/stegsolve/stegsolve.jar -O /opt/stegtools/stegsolve.jar

echo "End Steg tools installation"

echo "Installing Reverse Engineering tools"

# Installe Ghidra (via téléchargement)
echo "[*] Téléchargement de Ghidra..."
mkdir -p /opt/reverse
wget -q https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.4.3_build/ghidra_10.4.3_PUBLIC_20240201.zip -O /opt/reverse/ghidra.zip
unzip -q /opt/reverse/ghidra.zip -d /opt/reverse/

# Installe radare2
echo "[*] Installation de radare2..."
apt install -y radare2 &> /dev/null

# Installe GDB (debugger classique)
echo "[*] Installation de gdb..."
apt install -y gdb &> /dev/null

# Installe Cutter (interface graphique pour radare2)
echo "[*] Installation de Cutter..."
add-apt-repository -y ppa:apandada1/cutter &> /dev/null
apt update &> /dev/null
apt install -y cutter &> /dev/null

echo "End Reverse Engineering tools installation"


echo "Installing Web tools"

# Installe Burp Suite (via téléchargement)
echo "[*] Téléchargement de Burp Suite Community..."
mkdir -p /opt/webtools
wget -q https://portswigger.net/burp/releases/download?product=community&version=2023.7.3&type=Jar -O /opt/webtools/burp_suite_community.jar

# Installe Nikto
echo "[*] Installation de Nikto..."
apt install -y nikto &> /dev/null

# Installe OWASP ZAP (Zed Attack Proxy)
echo "[*] Installation de OWASP ZAP..."
apt install -y zaproxy &> /dev/null

# Installe Gobuster (outil de brute-force de répertoires)
echo "[*] Installation de Gobuster..."
apt install -y gobuster &> /dev/null

# Installe dirb (outil de brute-force de répertoires)
echo "[*] Installation de dirb..."
apt install -y dirb &> /dev/null

# Installe wfuzz (outil de fuzzing HTTP)
echo "[*] Installation de wfuzz..."
apt install -y wfuzz &> /dev/null

# Télécharge WebScarab (outil de proxy HTTP)
echo "[*] Téléchargement de WebScarab..."
wget -q https://github.com/OWASP/owasp-webscarab-ng/releases/download/0.9.8/webscarab-0.9.8.zip -O /opt/webtools/webscarab.zip
unzip -q /opt/webtools/webscarab.zip -d /opt/webtools/

# Installe sqlmap
echo "[*] Installation de sqlmap..."
apt install -y sqlmap &> /dev/null

# Installe nmap
echo "[*] Installation de Nmap..."
apt install -y nmap &> /dev/null

echo "End Web tools installation"
