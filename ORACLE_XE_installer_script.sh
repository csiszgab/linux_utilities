/******************************************************
**
**  Installing ORACLE XE under ORACLE Linux
**
******************************************************/

-- download and install the latest Virtual Box (currently Virtual Box 7.0)
-- download and install ORACLE LINUX into a virtual machine
-- installing Virtual Box Guest Additions
--   unfortunately clipboard is the only thing which is working, share folders for example is not working

-- creating ORACLE user account
--downloading oracle-database-preinstall-21c from ORACLE official web page

-- modifying the sudoers file, which is located in: /etc/sudoers
sudo visudo -f /etc/sudoers.d/cgabor

-- installing ORACLE XE
 dnf -y install oracle-database-preinstall-21c
 
-- configuring the database, setting passwords for SYS, etc
/etc/init.d/oracle-xe-21c configure

-- setting environment variables  
export ORACLE_SID XE
export ORAENV_ASK NO
. /opt/oracle/product/21c/dbhomeXE

-- ORACLE SQL DEVELOPER
rpm -ivh ./jdk-11.0.24_linux-x64_bin.rpm 
rpm -ivh sqldeveloper-23.1.1-345.2114.noarch.rpm 

-- Logging into the ORACLE XE database - not in line with the installation manual
sqlplus sys/oracle_password@XE as sysdba
 
/******************************************************
**
**  Installing git under ORACLE Linux
**
******************************************************/

sudo dnf install git-all
git config --list --show-origin
git config --global user.name "Gábor Csiszár"
git config --global user.email "csiszar005gabor@gmail.com"
git config --list --show-origin
git config --global core.editor sqldeveloper
git config --global init.defaultBranch main
git config --list --show-origin

-- ssh key generation
ssh-keygen -t rsa -b 4096 -C "csiszar005gabor@gmail.com"
-- copy id_rsa.pub into github account
-- 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

-- initializing project
-- step into project directory
git init
git add *.*
git status
git commit -m 'Initial Linux Utilities project version'

-- cloning project
git clone git@github.com:csiszgab/linux_utilities.git ./linux_utilities/

