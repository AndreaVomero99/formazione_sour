# APACHE Web Server setup on RockyLinux

## Required files:

### The whole process will be hosted on an Oracle Virtual Box, hence all the ISO's shall be of an a AMD64 architecture

https://rockylinux.org/it/download   _Minimal version of the ISO_

https://www.debian.org/distrib/netinst  _AMD64 is to be chosen_

## Configure the network

To ensure communication between the two VM's, we will need to set up a "Bridge connection" on the individual VM general settings

Next, we can check if all is in working order with a ping, in this case we shall try to reach the Debian machine, from Rocky:

#### ping -c 3 _ip_debian_

We can gather the address of our current VM with the following command:
#### ip addr

In the output, you will find the 32 bit IPV4 address

## Configure VM Rocky9

### Rocky will host the APACHE web server

First things first, we may want to update the Red Hat packet manager database

#### sudo dnf update -y

By inserting the -y, we will skip the required confirmation from the user on single package basis

We can finally download the Apache package. Being on a Red Hat system, it will be known as httpd


#### sudo dnf install httpd -y

Let us now jumpstart APACHE

#### sudo systemctl start httpd

Let's be meticolous, with the next command the APACHE server will be started on every reboot, without manual input

#### sudo systemctl enable httpd

### Firewall settings

We'll go nowhere if we don't take a look at the firewall settings, this would be the optimal configuration as to ensure that the service turns functional


#### sudo firewall-cmd --permanent --zone=public --add-service=http
#### sudo firewall-cmd --permanent --zone=public --add-service=https
#### sudo firewall-cmd --reload

### Last check-up

We can also restart the service, just in case something didn't quite get computed

#### sudo systemctl restart httpd

And we can of course get a status scan

#### sudo systemctl status httpd

Should everything be in working order, we'll be able to spot a light green "active(running)" and "enabled"

Now let's gather our trusty Rocky VM's ip address, and try to launch a web search with it by inserting said address in the URL. Hopefully you will be able to land on a "skeleton" web page

### Modifica pagina html del server APACHE

Time to add a personal touch, we can overwrite by using a redirection the html file linked to the APACHE web page

#### echo "Hello DevOpsTribe!" > /var/www/html/index.html

In the event that we are not allowed to get through with the edit we may want to perform a little trick

#### sudo chmod o+w /var/www/html

#### echo "Hello DevOpsTribe!" > /var/www/html/index.html

#### sudo chmod o-w /var/www/html

By this action, we first gave everyone the permission to edit your file, then proceeded with the overwrite, and finally we took back the privilege 

## Configure Debian

To test if Debian can reach the APACHE web page from the command line, we can follow through with a curl command

With it being not by default on the Debian system, we necessarily have to get its package, this time using the Debian packet manager APT

#### sudo apt update

#### sudo apt install curl

Let's bring it home, it is time to proceed with our last test. 

We will "curl" the ip address of the Rocky machine, should everything been gone accordingly, you will see the "Hello DevOpsTribe!" string on your terminal

#### sudo curl 192.168.178.101








