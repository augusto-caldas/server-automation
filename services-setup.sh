#!/usr/bin/env bash

while true;
do
  echo "Choose a service to be installed"
  echo "1. Nextcloud"
  echo "2. Bitwarden"
  echo "3. Jellyfin"
  echo "4. Minecraft server"
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
      echo "Bitwarden setup is not available at the moment"
      ;;

    "3")
      echo "Jellyfin setup is not available at the moment"
      ;;

    "4")
      echo "Installing Minecraft server..."
      mkdir minecraft-server
      wget -P ./minecraft-server "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/minecraft-setup.sh"
      bash ./minecraft-server/minecraft-setup.sh
      ;;

    *)
      echo "Invalid Input"
      ;;

  esac
done