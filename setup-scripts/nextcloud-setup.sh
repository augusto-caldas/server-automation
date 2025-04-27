echo "Downloading Docker compose file and creating directories..."
wget -P ./nextcloud "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/docker-compose.nextcloud.yaml"
mkdir ./nextcloud/config
mkdir ./nextcloud/data

echo "File downloaded and directories created successfully!"
read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f ./nextcloud/docker-compose.nextcloud.yaml up -d
