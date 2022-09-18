#!/bin/sh

min="64M"
max="256M"

echo "Beginning server"
cd servers/Purpurfall_V6/Waterfall
java -Xms$min -Xmx$max -jar waterfall.jar nogui
