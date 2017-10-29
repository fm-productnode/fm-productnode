#!/usr/bin/env bash
#
# Author: Franz Muehlbauer, info@fm-productnode.de
# License: MIT
#

#
# Ubuntu
#

sudo ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
sudo bash -c 'echo "LC_ALL=de_DE.UTF-8" >> /etc/environment'
echo "export LANG=de_DE.UTF-8" >> /home/ubuntu/.bashrc
export LANG=de_DE.UTF-8
sudo locale-gen "de_DE.UTF-8"
sudo dpkg-reconfigure locales

sudo apt-get update \
	&& sudo apt-get install -qq curl unzip python-software-properties software-properties-common
sudo apt-get update \
	&& sudo apt-get install -qq --no-install-recommends re2c libicu55 libicu-dev libssl-dev libzip-dev libsasl2-dev time

#
# PHP 7.0
#

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E5267A6C
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-key update

sudo apt-get update \
	&& sudo apt-get install -qq php7.0 php7.0-cli php7.0-dev php7.0-mcrypt php7.0-mbstring php7.0-curl php7.0-gd php7.0-intl php7.0-xsl php7.0-zip php7.0-sqlite3 php-pear \
	&& sudo rm -r /var/lib/apt/lists/*

sudo service apache2 stop

iniFile="/etc/php/7.0/cli/php.ini"

sudo sed -i "s#;date.timezone =.*#date.timezone = \"Europe/Berlin\"#" $iniFile

echo "memory_limit = -1" >> $iniFile
echo "display_errors = On" >> $iniFile
echo "register_argc_argv = Off" >> $iniFile
echo "auto_globals_jit = On" >> $iniFile
echo "post_max_size = 0" >> $iniFile
echo "allow_url_fopen = On" >> $iniFile
echo "allow_url_include = Off" >> $iniFile
echo "short_open_tag = Off" >> $iniFile
echo "date.default_latitude = 52.5194" >> $iniFile
echo "date.default_longitude = 13.4067" >> $iniFile

#
# ionCube Loader
#

set -x

sudo curl -SL "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz" \
	-o /opt/ioncube_loaders_lin_x86-64.tar.gz \
	&& sudo mkdir -p /opt/ioncube \
	&& sudo tar -xof /opt/ioncube_loaders_lin_x86-64.tar.gz -C /opt/ioncube --strip-components=1 \
	&& sudo rm /opt/ioncube_loaders_lin_x86-64.tar.gz* \
	&& sudo echo "zend_extension =/opt/ioncube/ioncube_loader_lin_7.0.so" | \
			sudo tee /etc/php/7.0/mods-available/ioncube_loader.ini \
	&& sudo ln -s /etc/php/7.0/mods-available/ioncube_loader.ini /etc/php/7.0/cli/conf.d/01-ioncube_loader.ini

#
# fm-ProductNode Release 2.1
#

mkdir -p /home/ubuntu/fm-productnode \
	&& curl -SL "https://muehlbauer.ocloud.de/index.php/s/tv0OE2NkHEUQaa5/download" \
		-o /home/ubuntu/fm-productnode/fmProductNode.tar.gz \
	&& tar -xof /home/ubuntu/fm-productnode/fmProductNode.tar.gz -C /home/ubuntu/fm-productnode \
	&& sudo chown -R ubuntu:ubuntu /home/ubuntu/fm-productnode \
	&& rm /home/ubuntu/fm-productnode/fmProductNode.tar.gz
