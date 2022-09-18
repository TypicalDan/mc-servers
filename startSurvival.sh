#!/bin/sh

min="2G"
max="6G"

echo "Beginning server"
cd servers/Purpurfall_V6/PurpurSurvival
java -Xms$min -Xmx$max -jar purpur.jar nogui
