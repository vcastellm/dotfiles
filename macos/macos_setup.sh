#!/bin/bash
#
# MacOS Setup script
#

#Uninstall macports
clear # Clear the screen.

read -p "Uninstall macports (y/n)?"
if [ $REPLY == "y" ]; then
	echo "Uninstalling macports..."
	sudo port -f uninstall installed

	sudo rm -rf /opt/local \
	/Applications/MacPorts \
	/Applications/DarwinPorts \
	/Library/Tcl/macports1.0 \
	/Library/Tcl/darwinports1.0 \
	/Library/LaunchDaemons/org.macports.* \
	/Library/StartupItems/DarwinPortsStartup \
	/Library/Receipts/MacPorts*.pkg \
	/Library/Receipts/DarwinPorts*.pkg \
	~/.macports
fi

read -p "Replace httpd.conf (with PHP5 enabled one) (y/n)?"
if [ $REPLY == "y" ]; then
	sudo mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.bak
	sudo cp -f ./httpd.conf /etc/apache2
fi

#replace term colors
read -p "Replace .profile file with one with term colors (y/n)?"
if [ $REPLY == "y" ]; then
	mv ~/.profile ~/.profile.bak
	cp ./profile ~/.profile
fi

read -p "Setup homebrew and install git + mysql (y/n)?"
if [ $REPLY == "y" ]; then
	#Setup homebrew
	sudo chown -R `whoami` /usr/local

	#Try to install brew
	ruby -e "$(curl http://gist.github.com/raw/323731/install_homebrew.rb)"
	
	brew install git
	
	read -p "Delete old mysql installed package (y/n)?"
	if [ $REPLY == "y" ]; then
		sudo rm /usr/local/mysql
		sudo rm -rf /usr/local/mysql*
		sudo rm -rf /Library/StartupItems/MySQLCOM
		sudo rm -rf /Library/PreferencePanes/My*
		rm -rf ~/Library/PreferencePanes/My*
		sudo rm -rf /Library/Receipts/mysql*
		sudo rm -rf /Library/Receipts/MySQL*
	fi
	
	brew install mysql
	
	read -p "Move MAMP dbs to new mysql installation (y/n)?"
	if [ $REPLY == "y" ]; then
		sudo mkdir -p /usr/local/var/mysql
		#Optional move MAMP db files to new mysql native installation
		sudo cp -rf /Applications/MAMP/db/mysql/* /usr/local/var/mysql
	else
		#Optional extra configuration
		read -p "Do you want to create mysql initial config (y/n)?"
		if [ $REPLY == "y" ]; then
			mysql_install_db
		fi
	fi

	cp /usr/local/Cellar/mysql/5.1.47/com.mysql.mysqld.plist ~/Library/LaunchAgents
	launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist
	
	brew install xdebug
	brew install wget
fi

#xdebug download
#http://downloads.activestate.com/Komodo/releases/6.0.0a2/remotedebugging/Komodo-PHPRemoteDebugging-6.0.0-alpha2-42361-macosx.tar.gz






