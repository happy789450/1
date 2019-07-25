#!/bin/bash
#该脚本功能为一键安装部署LNMP
cd /home
tar -xf lnmp_soft.tar.gz
cd lnmp_soft
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2
useradd -s /sbin/nologin nginx
yum -y install gcc pcre-devel openssl-devel httpd-tools mariadb mariadb-server mariadb-devel php php-mysql php-fpm libreswan git
./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install
systemctl start mariadb
systemctl enable mariadb
echo "mariadb 已启动,并开机自启"
systemctl start php-fpm
systemctl enable php-fpm
echo "php-fpm 已启动,并开机自启"
echo 环境准备完毕 配置文件还需手动更改才能生效 
