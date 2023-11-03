# Publishing Web on Darkweb

## Basic nginx setup
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
Restart nginx:
```bash
sudo systemctl restart nginx
#or
service nginx restart
```
Now if your folder is in /var/www/ then you can access index file in your local host.<br>

## Configure Tor
### Install Tor
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
