echo "Downloading Docker compose file and creating directories..."
wget -P ./vaultwarden "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/configuration-files/docker-compose.vaultwarden.yaml"
mkdir ./vaultwarden/data

echo "Creating environment file..."

echo "Enter domain/subdomain where you'll host Vaultwarden, has to start with http:// or https:// (default: http://nixos)"
echo -n ">> "
read -r DOMAIN
DOMAIN=${DOMAIN:-"nixos"}

while true;
do
    echo "Enter admin token (Min. 5 characters and preferably a secure random string)"
    echo -n ">> "
    read -r ADMIN_TOKEN

    # Check if the length of the input is at least 5 characters
    if [[ ${#ADMIN_TOKEN} -ge 5 ]];
    then
        break
    else
        echo "Error: Token must be at least 5 characters long. Please try again."
    fi
done

cat <<EOF > ./vaultwarden/vaultwarden.env
DOMAIN="${DOMAIN}"
ADMIN_TOKEN="${ADMIN_TOKEN}"
EOF

echo "Environment file created"
echo "Docker environment variables can be found and modified in vaultwarden.env"

read -r -p "<Press enter to continue and start service>"

echo "Starting docker..."
docker-compose -f ./vaultwarden/docker-compose.vaultwarden.yaml up -d