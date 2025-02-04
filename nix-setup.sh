#!/usr/bin/env bash

# Prompt user for input
echo "Enter the hostname (default: host)"
read -r hostName
hostName=${hostName:-host}

echo "Enter the time zone (default: America/New_York)"
read -r timeZone
timeZone=${timeZone:-America/New_York}

echo "Enter the username (default: user)"
read -r userName
userName=${userName:-user}

# Create variables.nix file
cat <<EOF > variables.nix
{
  hostName = "${hostName}";
  timeZone = "${timeZone}";
  userName = "${userName}";
}
EOF

# Notify user
echo "variables.nix has been created successfully!"
