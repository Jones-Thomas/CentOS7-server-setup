--------Centos7----------
# Update the server after first boot
#This will not install any new packages other than updating and installing the latest version of installed packages and security updates. Moreover Update and Upgrade are pretty same except the fact that Upgrade = Update + enable obsoletes processing during updates.
echo "Updating the centos7 server"
yum -y update && yum -y upgrade
echo "Server is up-to-date"

# Enable Third Party Repositories
#It is not a good idea to add untrusted repositories specially in production and it may be fatal. However just for example here we will be adding a few community approved trusted repositories to install third party tools and packages.
# Add Extra Package for Enterprise Linux (EPEL) Repository.
yum -y install epel-release
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
echo "epel-release is Installed"


#  Install Apache web server on CentOS. Issue following command:
echo "Installing the Apache webserver"
yum -y install httpd
echo "Apache webserver is up and running"

# Install PHP5 and PHP5 MySQL module
echo "Install PHP5 and PHP5 MySQL module"
yum -y install php php-mysql
yum -y install php-common php-cli php-devel php-fpm php-gd php-imap php-intl php-mysql php-process php-xml php-xmlrpc php-zts
echo "PHP and MySql is installed"

# Finally restart the Apache web server so it can reload appropriately:
echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
service httpd restart
chkconfig httpd on
echo "Apache is running in localhost:80"

# Install MySQL using yum on CentOS. Issue following command:
echo "Install MySQL using yum on CentOS"
yum -y install mysql-server
echo "Mysql-server is installed"
service mysqld start
echo "Mysql is running"
echo " use this command to config mysql: /usr/bin/mysql_secure_installation"

