#!/bin/sh

echo "Removing old files..."
sudo rm -r /home/minecraft/mc-servers

echo "Fetching new files..."
sudo git clone https://github.com/TypicalDan/mc-servers /home/minecraft/mc-servers
sudo chown -R minecraft /home/minecraft/mc-servers
sudo chown -R dan /home/minecraft/mc-servers
echo "Finished downloading!"

echo "Moving script..."
sudo mv /home/minecraft/mc-servers/update-mc.sh update-mc.sh
echo "All done!"
