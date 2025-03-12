#!/usr/bin/env bash

while true;
do
  echo "Choose a service to be installed"
  echo "1. Nextcloud"
  echo "2. Vaultwarden"
  echo "3. Jellyfin"
  echo "4. Minecraft server"
  echo "5. MySQL"
  echo "6. MongoDB"
  echo "0. Exit"
  echo -n ">> "
  read -r SERVICE

  case $SERVICE in

    "0")
      echo "Closing..."
      exit 0
      ;;

    "1")
      echo "Nextcloud setup is not available at the moment"
      ;;

    "2")
      echo "Installing Vaultwarden..."
      mkdir vaultwarden
      wget -P ./vaultwarden "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/vaultwarden-setup.sh"
      bash ./vaultwarden/vaultwarden-setup.sh
      ;;

    "3")
      echo "Installing Jellyfin..."
      mkdir jellyfin
      wget -P ./jellyfin "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/jellyfin-setup.sh"
      bash ./jellyfin/jellyfin-setup.sh
      ;;

    "4")
      echo "Installing Minecraft server..."
      mkdir minecraft-server
      wget -P ./minecraft-server "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/minecraft-setup.sh"
      bash ./minecraft-server/minecraft-setup.sh
      ;;

    "5")
      echo "Installing MySQL..."
      mkdir mysql
      wget -P ./mysql "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/mysql-setup.sh"
      bash ./mysql/mysql-setup.sh
      ;;

    "6")
      echo "Installing MongoDB..."
      mkdir mongodb
      wget -P ./mongodb "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/mongodb-setup.sh"
      bash ./mongodb/mongodb-setup.sh
      ;;

    *)
      echo "Invalid Input"
      ;;

  esac
done