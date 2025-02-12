#!/usr/bin/env bash
echo "Downloading default configuration file..."
mkdir nixos
wget -P nixos "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/configuration.nix"

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
cat <<EOF > ./nixos/variables.nix
{
  hostName = "${HOST_NAME}";
  timeZone = "${TIME_ZONE}";
  userName = "${USERNAME}";
}
EOF
echo "variables.nix has been created successfully!"

# Warning user
echo "All the configuration files will be copied to /etc/nixos."
echo "This means it will overwrite the configuration.nix file in the directory."
read -r -p "<Press enter to continue or ctrl + c to cancel>"

# Copy .nix files to /etc/nixos/
sudo cp ./nixos/variables.nix /etc/nixos/variables.nix
sudo cp ./nixos/configuration.nix /etc/nixos/configuration.nix

echo "Configuration files have been copied successfully!"
echo "Feel free to make any changes in the default configuration file found in /etc/nixos/"
echo "Please run 'sudo nixos-rebuild boot --upgrade' to build the system with new configuration and reboot the system once done"
