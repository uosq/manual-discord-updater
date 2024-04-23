#!/bin/bash

# https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

echo 'Downloading Discord tar.gz'
wget -O 'discord.tar.gz' 'https://discord.com/api/download?platform=linux&format=tar.gz'

echo 'Removing wget-log'
rm wget-log

echo 'Extracting discord.tar.gz'
tar -xpvf discord.tar.gz

echo 'Deleting /opt/discord'
rm -rf /opt/discord

echo 'Moving Discord folder to /opt/discord'
mv -v Discord /opt/discord

echo 'Removing discord.tar.gz'
rm -rf discord.tar.gz
