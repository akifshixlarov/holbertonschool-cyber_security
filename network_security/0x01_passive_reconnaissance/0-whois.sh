#!/bin/bash
sudo whois "$1" | awk -F: '
/Registrant Name|Registrant Organization|Registrant Street|Registrant City|Registrant State|Registrant Postal Code|Registrant Country|Registrant Phone|Registrant Phone Ext/{
  gsub(/^[ \t]+/, "", $2);
  if ($1 ~ /Street/) print $1 "," $2 " ";
  else if ($1 ~ /Phone Ext/) print $1 ":," $2;
  else print $1 "," $2
}
/Admin Name|Admin Organization|Admin Street|Admin City|Admin State|Admin Postal Code|Admin Country|Admin Phone|Admin Phone Ext/{
  gsub(/^[ \t]+/, "", $2);
  if ($1 ~ /Street/) print $1 "," $2 " ";
  else if ($1 ~ /Phone Ext/) print $1 ":," $2;
  else print $1 "," $2
}
/Tech Name|Tech Organization|Tech Street|Tech City|Tech State|Tech Postal Code|Tech Country|Tech Phone|Tech Phone Ext/{
  gsub(/^[ \t]+/, "", $2);
  if ($1 ~ /Street/) print $1 "," $2 " ";
  else if ($1 ~ /Phone Ext/) print $1 ":," $2;
  else print $1 "," $2
}'
