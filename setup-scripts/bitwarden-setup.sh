echo "Downloading Docker compose file and creating directories..."
wget -P ./bitwarden "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/docker-compose.bitwarden.yaml"
mkdir ./bitwarden/data

echo "Creating environment file..."

echo "Enter domain or subdomain where you'll host Bitwarden (default: nixos)"
echo -n ">> "
read -r BW_DOMAIN
BW_DOMAIN=${BW_DOMAIN:-"nixos"}

echo "Enter primary email address for automated notifications, certificate registration, etc. (default: admin@example.com)"
echo -n ">> "
read -r BW_EMAIL
BW_EMAIL=${BW_EMAIL:-"admin@example.com"}

echo "Enter email address to grant admin privileges (default: ${BW_EMAIL})"
echo -n ">> "
read -r BW_ADMIN_EMAIL
BW_ADMIN_EMAIL=${BW_ADMIN_EMAIL:-BW_ADMIN_EMAIL}

cat <<EOF > ./bitwarden/bitwarden.env
BW_DOMAIN="${BW_DOMAIN}"
BW_EMAIL="${BW_EMAIL}"
BW_ADMIN_EMAIL="${BW_ADMIN_EMAIL}"
EOF

echo "Environment file created"
echo "Docker environment variables can be found and modified in bitwarden.env"

read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f ./bitwarden/docker-compose.bitwarden.yaml up -d