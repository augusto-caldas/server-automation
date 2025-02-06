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
      echo "Installing Nextcloud..."
      ;;

    "2")
      echo "Installing Bitwarden..."
      ;;

    "3")
      echo "Installing Jellyfin..."
      ;;

    "4")
      echo "Installing Minecraft server..."
      wget "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/minecraft-setup.sh"
      bash ./minecraft-setup.sh
      ;;

    *)
      echo "Invalid Input"
      ;;

  esac
done