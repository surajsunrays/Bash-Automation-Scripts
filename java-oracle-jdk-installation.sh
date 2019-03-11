#!/bin/bash
#------------------------------------------------------------------------------------------
# Name: java-oracle-jdk-installation.sh
# Author: Suraj Bodade <suraj.bodade@zemosolabs.com>
# Description : This bash script will install java on ubuntu System.
# Args: NA
# License : NA
# -------------------------------------------------------------------------------------------
echo ">->->->->->-> Welcome to Java Installation <-<-<-<-<-<-<-<"
sleep 10
echo " --------------------- This bash script will install java 1.8 system ------------------"
echo "---------------------------------------------------------------------------------------"
# downloading the binary form oracle
url="https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-i586.tar.gz"
sudo wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" ${url}

sudo mkdir /opt/java
sudo mv jdk-8u201-linux-i586.tar.gz /opt/java/
cd /opt/java/
sudo tar -zxvf jdk*
# Updating the alternatives
sudo update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_201/bin/java 100
sudo update-alternatives --config java

sudo update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.8.0_201/bin/javac 100
sudo update-alternatives --config javac

sudo update-alternatives --install /usr/bin/jar jar /opt/java/jdk1.8.0_201/bin/jar 100
sudo update-alternatives --config jar

echo "export JAVA_HOME=/opt/java/jdk1.8.0_201/" | sudo tee -a ~/.bashrc

echo "export JRE_HOME=/opt/java/jdk1.8.0_201/jre" | sudo tee -a ~/.bashrc

echo "export PATH=$PATH:/opt/java/jdk1.8.0_201/bin:/opt/java/jdk1.8.0_201/jre/bin" | sudo tee -a ~/.bashrc

source ~/.bashrc

sudo apt-get install libc6-i386

echo "-------------->>>------------ Installation Completed Successfully ------------------<<<<<<----------------"
echo "----------------------------- Checking the Installation --------------------------------------------------"
java -version

exit 0
