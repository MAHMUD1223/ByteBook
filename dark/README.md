# Publishing Web on Darkweb

# Basic nginx setup
### install nginx and start
```bash
sudo apt install nginx
sudo systemctl start nginx
#If systemctl fails try:
sudo service nginx start
```
Now go to the browser and see your local host port 80.
### Configure nginx
```bash
nano /etc/nginx/sites-available/default
```
Then edit folder location only in following lines in the file:
```bash
server {
    listen 80:
    server_name
    location / {
        root /var/www/<your folder>;
        index index.html index.htm;
    }
```
Check and restart nginx:
```bash
nginx -t
sudo systemctl restart nginx
#or
service nginx restart
```
Now if your folder is in /var/www/ then you can access index file in your local host.<br>

# Configure Tor
### Install Tor(Manual)
Get you distribution name by:
```bash
cat /etc/debian_version # Take the output of before the slash
```
Set up the apt repo:
```bash
nano /etc/apt/sources.list.d/tor.list
```
then add the following line where <DISTRUBUTION> is your distribution name that you git previously:
```bash
deb [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org <DISTRIBUTION> main 
deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org <DISTRIBUTION> main
```
Now add the gpg key:
```bash
wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
```
now update and install tor:
```bash
apt update && apt install tor deb.torproject.org-keyring
```
For more info go to [Tor](https://support.torproject.org/apt/tor-deb-repo/)
## Installing tor (auto)
This is just a basic installation nothing more.It might not have the latest tor.
```bash
apt install tor
```
## Setting up a onion and run
Edit this file:
```bash
nano /etc/tor/torrc
```
Find below lines and edit
```bash
############### This section is just for location-hidden services ###

## Once you have configured a hidden service, you can look at the
## contents of the file ".../hidden_service/hostname" for the address
## to tell people.
##
## HiddenServicePort x y:z says to redirect requests on port x to the
## address y:z.

HiddenServiceDir /var/lib/tor/hidden_service/ #uncooment this line
HiddenServicePort 80 127.0.0.1:80 #uncomment this line

#HiddenServiceDir /var/lib/tor/other_hidden_service/
#HiddenServicePort 80 127.0.0.1:80
#HiddenServicePort 22 127.0.0.1:22
```
Now go to `/var/lib/tor/hidden_service/` and cat the hostname and you got a darkweb site
```bash
cd /var/lib/tor/hidden_service/
ls
cat 
```
That's it. Now your web is in darkweb.
# Getting custom address v3
Now as you can see the domain name is quite messy but we can't do anything about that.So,What we can do is to edit some of the alphanumaric value of the address.
## Getting mkp224o
Installing dependencies:
```bash
apt install gcc libc6-dev libsodium-dev make autoconf -y
```
Now cloning the repo mkp224o:
```bash
git clone https://github.com/cathugger/mkp224o
```
## Setting mkp224o
Just run below command:
```bash
cd mkp224o
./autogen.sh
./configure
make
```
## Starting brute force to genarate custom address
The command should be like
```bash
./mkp224o <custom word> -v -n <address count> -d <folder to save the domain> -t <for therds(optional)>
```
## Using custom address
Move to the folder that used is `-d` argumend and enter the addressed folder in it.
Use below command:
```bash
cp * /var/lib/tor/hidden_service
```
Now restart the tor service
```bash
systemctl restart tor
# or
service tor restart
# or use htop to manually turn of tor if doesn't work
```
# Finishing
That's all you have to do in order to have a onion site on internet and have a custom domain.Thank you for following me.
