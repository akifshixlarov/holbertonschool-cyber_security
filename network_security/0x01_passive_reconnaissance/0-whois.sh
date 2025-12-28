#!/bin/bash
sudo whois "$1" | awk -F: '/(Registrant|Admin|Tech) (Name|Organization|Street|City|State|Postal Code|Country|Phone|Phone Ext|Fax|Fax Ext|Email)/ { gsub(/^[ \t]+/, "", $2); if ($1 ~ /Street/) print $1 "," $2 " "; else if ($1 ~ /Phone Ext|Fax Ext/) print $1 ":," $2; else print $1 "," $2 }' > "$1.csv"
