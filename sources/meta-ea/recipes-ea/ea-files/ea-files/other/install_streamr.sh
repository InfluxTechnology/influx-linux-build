#!/bin/sh

location_folders() {
	LOCATION_NODE="/usr/bin/"
	if [ -f /usr/local/bin/node ]; then 
		LOCATION_NODE="/usr/local/bin/"
	fi

	LOCATION_NPM="/usr/bin/"
	if [ -f /usr/local/bin/npm ]; then 
		LOCATION_NPM="/usr/local/bin/"
	fi
}

RESULT=$(/sbin/ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2)
if [[ $RESULT == "" ]]; then
	echo "No IP assigned to wlan0 interface."
	exit 1
fi

PWD=$(pwd)
if [ -d $PWD/node_modules/streamr-client ]; then
        echo "streamr-client already installed."
	read -p "Do you want to update it? (y/N)" RESULT
	if [  "$RESULT" == "n" ] ||  [  "$RESULT" == "N" ] ||  [  "$RESULT" == "" ] ; then
		exit 1
	else
		echo ""
	fi
fi


location_folders
echo -n "node version: "
$LOCATION_NODE/node -v
echo -n "npm version: "
$LOCATION_NPM/npm -v

if [ ! -f /usr/bin/n ]; then
	$LOCATION_NPM/npm install -g n 

	if [ ! -f /usr/bin/n ]; then
       		echo "Can not install n version manager."
       		exit 1
	fi
fi

sleep 2

RESULT=$(/usr/bin/n 15.13.0 | grep 'installed')
if [[ $RESULT == "" ]]; then
        echo "Can not upgrade node.js."
       	exit 1
fi

hash -r
echo "Node manager updated"
sleep 2

location_folders
echo -n "node version: "
$LOCATION_NODE/node -v
echo -n "npm version: "
$LOCATION_NPM/npm -v

/usr/local/bin/npm install streamr-client
if [ ! -d $PWD/node_modules/streamr-client ]; then
       	echo "streamr-client not installed."
	exit 1
fi

RESULT=$(cat /data/mender/preserved-files | grep $PWD/node_modules)
if [[ $RESULT == "" ]]; then
       	echo $PWD/node_modules/ >> /data/mender/preserved-files
	echo $PWD/package-lock.json >> /data/mender/preserved-files
	echo $PWD/package.json >> /data/mender/preserved-files
fi

echo "Streamr client installed"


