echo "Downloading Docker compose file and creating directories..."
wget -P ./minecraft-server "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/docker-compose.minecraft.yaml"
mkdir ./minecraft-server/data

echo "Creating environment file..."

echo "Enter minecraft version (default: 1.21.4)"
echo -n ">> "
read -r MINECRAFT_VERSION
MINECRAFT_VERSION=${MINECRAFT_VERSION:-"1.21.4"}

echo "Enter max memory in GB (default: 8)"
echo -n ">> "
read -r MINECRAFT_MAX_MEMORY
MINECRAFT_MAX_MEMORY=${MINECRAFT_MAX_MEMORY:-"8"}

cat <<EOF > ./minecraft-server/minecraft.env
EULA="TRUE"
MAX_MEMORY="${MINECRAFT_MAX_MEMORY}G"
VERSION="${MINECRAFT_VERSION}"
EOF

echo "Environment file created"
echo "Docker environment variables can be found and modified in minecraft.env"

read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f ./minecraft-server/docker-compose.minecraft.yaml up -d
