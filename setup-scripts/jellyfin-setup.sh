echo "Downloading Docker compose file and creating directories..."
wget -P ./jellyfin "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/docker-compose.jellyfin.yaml"
mkdir ./jellyfin/config
mkdir ./jellyfin/tvshows
mkdir ./jellyfin/movies

echo "File downloaded and directories created successfully!"
read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f ./jellyfin/docker-compose.jellyfin up -d
