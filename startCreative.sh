#!/bin/sh

min="1G"
max="4G"

echo "Starting server with $max RAM..."
cd servers/Purpurfall_V6/PurpurCreative
java -Xms$min -Xmx$max -jar purpur.jar nogui
