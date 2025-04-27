#!/usr/bin/env bash

check_and_prompt() {
  local folder=$1
  local container=$2

  if [ -d "$folder" ] || docker ps -a --format '{{.Names}}' | grep -wq "$container"; then
    echo "Warning: Folder '$folder' or Docker container/service '$container' already exists."
    read -rp "Do you want to remove them and continue? (y/n): " response

    if [[ "$response" == "y" || "$response" == "Y" ]]; then
      [ -d "$folder" ] && rm -rf "$folder" && echo "Removed folder '$folder'."

      if docker ps -a --format '{{.Names}}' | grep -wq "$container"; then
        docker rm -f "$container"
        echo "Removed Docker container/service '$container'."
      fi

    else
      echo "Installation canceled."
      return 1
    fi

  fi

  return 0
}

while true; do
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
      if check_and_prompt "./nextcloud" "nextcloud"; then
        echo "Installing Nextcloud..."
        mkdir nextcloud
        wget -P ./nextcloud "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/nextcloud-setup.sh"
        bash ./nextcloud/nextcloud-setup.sh
      fi
      ;;

    "2")
      if check_and_prompt "./vaultwarden" "vaultwarden"; then
        echo "Installing Vaultwarden..."
        mkdir vaultwarden
        wget -P ./vaultwarden "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/vaultwarden-setup.sh"
        bash ./vaultwarden/vaultwarden-setup.sh
      fi
      ;;

    "3")
      if check_and_prompt "./jellyfin" "jellyfin"; then
        echo "Installing Jellyfin..."
        mkdir jellyfin
        wget -P ./jellyfin "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/jellyfin-setup.sh"
        bash ./jellyfin/jellyfin-setup.sh
      fi
      ;;

    "4")
      if check_and_prompt "./minecraft-server" "minecraft-server"; then
        echo "Installing Minecraft server..."
        mkdir minecraft-server
        wget -P ./minecraft-server "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/minecraft-setup.sh"
        bash ./minecraft-server/minecraft-setup.sh
      fi
      ;;

    "5")
      if check_and_prompt "./mysql" "mysql"; then
        echo "Installing MySQL..."
        mkdir mysql
        wget -P ./mysql "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/mysql-setup.sh"
        bash ./mysql/mysql-setup.sh
      fi
      ;;

    "6")
      if check_and_prompt "./mongodb" "mongodb"; then
        echo "Installing MongoDB..."
        mkdir mongodb
        wget -P ./mongodb "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/setup-scripts/mongodb-setup.sh"
        bash ./mongodb/mongodb-setup.sh
      fi
      ;;

    *)
      echo "Invalid Input"
      ;;

  esac
done