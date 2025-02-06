#!/usr/bin/env bash
echo "Downloading default configuration file..."
wget "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration.nix"

echo "Enter the username (default: admin)"
echo -n ">> "
read -r USERNAME
USERNAME=${USERNAME:-admin}

echo "Enter the host name (default: nixos)"
echo -n ">> "
read -r HOST_NAME
HOST_NAME=${HOST_NAME:-nixos}

echo "Enter the time zone (default: Europe/Dublin)"
echo -n ">> "
read -r TIME_ZONE
TIME_ZONE=${TIME_ZONE:-Europe/Dublin}

# Create variables.nix file
echo "Creating variables.nix file..."
cat <<EOF > variables.nix
{
  hostName = "${HOST_NAME}";
  timeZone = "${TIME_ZONE}";
  userName = "${USERNAME}";
}
EOF
echo "variables.nix has been created successfully!"

# Copy .nix files to /etc/nixos/
sudo cp variables.nix /etc/nixos/variables.nix
sudo cp configuration.nix /etc/nixos/configuration.nix

echo "Configuration files have been copied successfully! Feel free to make any changes in the default configuration"
echo "Please run 'sudo nixos-rebuild boot --upgrade' to build the system with new configuration and reboot the system once done"
