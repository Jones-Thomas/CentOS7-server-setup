--------Centos7----------
# Update the server after first boot
#This will not install any new packages other than updating and installing the latest version of installed packages and security updates. Moreover Update and Upgrade are pretty same except the fact that Upgrade = Update + enable obsoletes processing during updates.

yum -y update && yum -y upgrade
# Enable Third Party Repositories
#It is not a good idea to add untrusted repositories specially in production and it may be fatal. However just for example here we will be adding a few community approved trusted repositories to install third party tools and packages.
# Add Extra Package for Enterprise Linux (EPEL) Repository.

yum -y install epel-release
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
echo "epel-release is Installed"

# Configure Network with Static IP Address  [Provides ifconfig utility] The first thing you need to do is to configure Static IP address, Route and DNS to your CentOS Server. We will be using ip command the replacement of ifconfig command. However, ifconfig command is still available for most of the Linux distributions and can be installed from default repository.
# Install network and system utilities.
yum -y install net-tools 
yum -y install bind-utils
yum -y install fingers

echo -e "ip addr show"

# Set HostName of Server
# The next thing to do is to change the HOSTNAME of the CentOS sever. Check the currently assigned HOSTNAME.

echo "Centos7" > /etc/hostname
echo $HOSTNAME

# Install Command Line Web Browser

yum -y install links
echo "Link is installed"

# Install GCC (GNU Compiler Collection)

yum -y install gcc
echo "gcc is installed"

# Install Nmap to Monitor Open Ports

yum -y install nmap
echo "nmap is installed"

# Installing Wget
# wget is a Linux command line based utility that retrieves (downloads) content from web servers. It is an important tool you must have to retrieve web contents or download any files using wget command.

yum -y install wget
echo "wget is installed"

# Installing Telnet
# Telnet is a network protocol that enables a user to login into another computer on the same network over TCP/IP. Once connection etablished to the remote computer it becomes a virtual terminal and allow you to communicate with the remote host within your computer as per whatever privileges provided to you, Telnet also very useful for checking listening ports on remote computer or host.

yum -y install telnet
echo "telnet  is installed"

# Install utilities iftop, atop, 
, lsof
yum -y install iftop
yum -y install htop
yum -y install atop
yum -y install lsof

# Install 7-zip Utility
# In the CentOS Minimal Install you don’t get utility like unzip or unrar. We have the option to install each utility as required or an utility that servers for all. 7-zip is such an utility which compress and extract files of all known types.

yum -y install p7zip

# To view the CPU temp
# To config use: sensors-detect

yum -y install lm_sensors

# Install NTFS-3G Driver
# A small yet very useful NTFS driver called NTFS-3G is available for most of the UNIX-like distribution. It is useful to mount and access Windows NTFS file system. Though other alternatives like Tuxera NTFS is available, NTFS-3G is most widely used.

yum -y install ntfs-3g
mount -ro ntfs-3g /dev/sda5 /mnt

# Install Rootkit Hunter
# Rootkit Hunter abbreviated as Rkhunter is an application that scan rootkits and other potentially harmful exploits in Linux systems.

yum -y install rkhunter

# Install mlocate
# Let's make sure that mlocate (locate command) is installed as it makes much easier when searching in Linux:
yum -y install mlocate
echo "mlocate is installed"

# Enable Virtualization with Virtualbox
# Virtualization is a process of creating virtual OS, Hardware and Network, is one of the most sought technology of these days. We will be discussing on how to install and configure virtualization in detail.
# Our CentOS Minimal server is a headless server. Lets prepare it to host virtual machines that is accessible over HTTP by installing following packages.
# yum -y groupinstall 'Development Tools' SDL kernel-devel kernel-headers dkms
# wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
# Install the key just downloaded.
# rpm --import oracle_vbox.asc
# Update and Install Virtualbox.
# yum update && yum install virtualbox-4.3
# Next, download and install Virtualbox extension pack.
# wget http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack
# VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack
# Reboot your System
echo "The system is going to perform a Reboot"
echo "Rebooting now.."
shutdown -r now
