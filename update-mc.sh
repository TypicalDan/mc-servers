#!/bin/sh
# System updates
echo "Checking for system updates..."
sudo apt update
echo "Updating system..."
sudo apt upgrade -y
echo "Finished system updates!"

# Old file removal
echo "Removing old files..."
sudo rm /home/minecraft/mc-servers -r
echo "Cleared repository destination!"
sudo rm /home/minecraft/servers/Purpurfall_V6/Waterfall/waterfall.jar
sudo rm /home/minecraft/servers/Purpurfall_V6/PurpurSurvival/purpur.jar
sudo rm /home/minecraft/servers/Purpurfall_V6/PurpurCreative/purpur.jar
echo "Cleared old jars!"
sudo rm /home/minecraft/servers/Purpurfall_V6/Waterfall/plugins -r
sudo rm /home/minecraft/servers/Purpurfall_V6/PurpurSurvival/plugins -r
sudo rm /home/minecraft/servers/Purpurfall_V6/PurpurCreative/plugins -r
echo "Cleared old plugins!"
sudo rm /home/minecraft/servers/Purpurfall_V6/PurpurSurvival/Bruhhh/datapacks -r
sudo rm /home/minecraft/servers/Purpurfall_V6/PurpurCreative/Bruhhh2/datapacks -r

# Github cloning
echo "Fetching new files..."
sudo git clone https://github.com/TypicalDan/mc-servers /home/minecraft/mc-servers
sudo chown -R minecraft /home/minecraft/mc-servers
echo "Finished downloading!"

# Finding .jar names
echo "Finding waterfall .jar..."
waterfallName=$(sudo ls /home/minecraft/mc-servers/jars/waterfall)
echo "New waterfall version is $waterfallName"

echo "Finding purpur .jar..."
purpurName=$(sudo ls /home/minecraft/mc-servers/jars/purpur)
echo "New purpur version is $purpurName"

# Showing new plugins
echo "Here are the new plugins:"
echo "For the waterfall server:"
sudo ls /home/minecraft/mc-servers/plugins/waterfall
echo "For the survival server:"
sudo ls /home/minecraft/mc-servers/plugins/survival
echo "For the creative server:"
sudo ls /home/minecraft/mc-servers/plugins/creative

echo "Here are the new datapacks:"
sudo ls /home/minecraft/mc-servers/datapacks

# Moving .jar files
echo "Moving .jar files..."
sudo mv /home/minecraft/mc-servers/jars/waterfall/$waterfallName /home/minecraft/servers/Purpurfall_V6/Waterfall/waterfall.jar
echo "Moved waterfall .jar!"
sudo cp -r /home/minecraft/mc-servers/jars/purpur/$purpurName /home/minecraft/servers/Purpurfall_V6/PurpurSurvival/purpur.jar
echo "Moved survival .jar!"
sudo mv /home/minecraft/mc-servers/jars/purpur/$purpurName /home/minecraft/servers/Purpurfall_V6/PurpurCreative/purpur.jar
echo "Moved creative .jar!"

# Moving plugins across
echo "Moving plugins..."
sudo mv /home/minecraft/mc-servers/plugins/waterfall /home/minecraft/servers/Purpurfall_V6/Waterfall/plugins
echo "Moved waterfall plugins!"
sudo mv /home/minecraft/mc-servers/plugins/survival /home/minecraft/servers/Purpurfall_V6/PurpurSurvival/plugins
echo "Moves survival plugins!"
sudo mv /home/minecraft/mc-servers/plugins/creative /home/minecraft/servers/Purpurfall_V6/PurpurCreative/plugins

# Moving datapacks across
echo "Moving datapacks..."
sudo cp -r /home/minecraft/mc-servers/datapacks/survival /home/minecraft/servers/Purpurfall_V6/PurpurSurvival/Bruhhh/datapacks
echo "Moved survival datapacks!"
sudo mv /home/minecraft/mc-servers/datapacks/creative /home/minecraft/servers/Purpurfall_V6/PurpurCreative/Bruhhh2/datapacks
echo "Moved creative datapacks!"

echo "Sorting permissions..."
sudo chown -R minecraft /home/minecraft/servers/Purpurfall_V6

echo "All done!"
