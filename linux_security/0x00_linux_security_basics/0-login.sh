#!/bin/bash

# Must be run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
  exit 1
fi

# Use absolute path
/usr/bin/last -n 5
