echo "Downloading Docker compose file and creating directories..."
wget -P ./mongodb "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/docker-compose.mongodb.yaml"
mkdir ./mongodb/data

echo "Creating environment file..."

echo "Enter MongoDB root username (default: root)"
echo -n ">> "
read -r MONGO_INITDB_ROOT_USERNAME
MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME:-"root"}

echo "Enter MongoDB root password (default: rootpass)"
echo -n ">> "
read -r MONGO_INITDB_ROOT_PASSWORD
MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD:-"rootpass"}

echo "Enter MongoDB database name (default: mydb)"
echo -n ">> "
read -r MONGO_INITDB_DATABASE
MONGO_INITDB_DATABASE=${MONGO_INITDB_DATABASE:-"mydb"}

cat <<EOF > ./mongodb/mongodb.env
MONGO_INITDB_ROOT_USERNAME="${MONGO_INITDB_ROOT_USERNAME}"
MONGO_INITDB_ROOT_PASSWORD="${MONGO_INITDB_ROOT_PASSWORD}"
MONGO_INITDB_DATABASE="${MONGO_INITDB_DATABASE}"
EOF

echo "Environment file created"
echo "Docker environment variables can be found and modified in mongodb.env"

read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f ./mongodb/docker-compose.mongodb.yaml up -d
