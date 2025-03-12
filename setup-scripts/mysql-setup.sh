echo "Downloading Docker compose file and creating directories..."
wget -P ./mysql "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/docker-compose.mysql.yaml"
mkdir ./mysql/data

echo "Creating environment file..."

echo "Enter MySQL root password (default: rootpass)"
echo -n ">> "
read -r MYSQL_ROOT_PASSWORD
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-"rootpass"}

echo "Enter MySQL database name (default: mydb)"
echo -n ">> "
read -r MYSQL_DATABASE
MYSQL_DATABASE=${MYSQL_DATABASE:-"mydb"}

echo "Enter MySQL user (default: user)"
echo -n ">> "
read -r MYSQL_USER
MYSQL_USER=${MYSQL_USER:-"user"}

echo "Enter MySQL user password (default: userpass)"
echo -n ">> "
read -r MYSQL_PASSWORD
MYSQL_PASSWORD=${MYSQL_PASSWORD:-"userpass"}

cat <<EOF > ./mysql/mysql.env
MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}"
MYSQL_DATABASE="${MYSQL_DATABASE}"
MYSQL_USER="${MYSQL_USER}"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
EOF

echo "Environment file created"
echo "Docker environment variables can be found and modified in mysql.env"

read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f ./mysql/docker-compose.mysql.yaml up -d
