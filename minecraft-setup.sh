echo "Downloading Docker compose file..."
wget "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/docker-compose.minecraft.yaml"

echo "Creating environment file..."
mkdir minecraft

echo "Enter minecraft version"
echo -n ">> "
read -r MINECRAFT_VERSION

echo "Enter max memory (default: 8G)"
echo -n ">> "
read -r MINECRAFT_MAX_MEMORY
MINECRAFT_MAX_MEMORY=${MINECRAFT_MAX_MEMORY:-8G}

cat <<EOF > minecraft.env
EULA="TRUE"
MAX_MEMORY="${MINECRAFT_MAX_MEMORY}G"
VERSION="${MINECRAFT_VERSION}"
EOF

echo "Environment file created"
echo "Environment variables can be found and modified in minecraft.env"

read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f docker-compose.minecraft.yaml up -d