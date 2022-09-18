#!/bin/sh

min="2G"
max="6G"

echo "Starting server with $max RAM..."
cd servers/Purpurfall_V6/PurpurSurvival
java -Xms$min -Xmx$max -jar purpur.jar nogui
