#!/usr/bin/env bash

echo "Enter the hostname (default: host)"
read -r hostName
hostName=${hostName:-nixos}

echo "Enter the time zone (default: America/New_York)"
read -r timeZone
timeZone=${timeZone:-America/New_York}

echo "Enter the username (default: user)"
read -r userName
userName=${userName:-admin}

# Create variables.nix file
echo "Creating variables.nix file..."
cat <<EOF > variables.nix
{
  hostName = "${hostName}";
  timeZone = "${timeZone}";
  userName = "${userName}";
}
EOF
echo "variables.nix has been created successfully!"

# Copy .nix files to /etc/nixos/
sudo cp variables.nix /etc/nixos/variables.nix
sudo cp configuration.nix /etc/nixos/configuration.nix

echo "Configuration files have been copied successfully!"
echo "Please run 'sudo nixos-rebuild boot --upgrade' to build the system with new configuration and reboot the system once done"
