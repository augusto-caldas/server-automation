<h1>server-automation</h1>
This project contains:<br>

1. A script (nix-setup.sh) to create a configuration.nix file with basic configuration to deploy the services provided
   in this project.<br>
2. A script (services-setup.sh) to create a proper structure and docker-compose files with basic configurations to
   deploy services with ease.<br>

<hr>

<h2 id="nix-setup">NixOS Setup</h2>
This script will create a configuration.nix file containing the basic nix configuration to deploy the services provided
in this project.<br>
In case you already have a configured system (It doesn't necessary have to be a NixOS system) with "wget", "docker"
and "docker-compose" installed this script can be ignored and you can proceed to <a href="#services-setup">services
setup</a>.

<h3>Guide</h3>

Start by running the following commands in your NixOS Server:<br>

If you already have "wget" installed you can skip the first command

```bash
nix-shell -p wget
```

Download "nix-setup.sh" script

```bash
wget "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/nix-setup.sh"
```

Run script and follow with the installation

```bash
sudo bash ./nix-setup.sh
```

Feel free to make any changes in the configuration.nix file and expand your server functionality.

<hr>

<h2 id="services-setup">Services Setup</h2>
This script will create the proper environment and deploy the services available in this project.<br>
The services available for now are:

1. ~~Nextcloud~~
2. Vaultwarden
3. Jellyfin
4. Minecraft

To proceed with the installation of the services you have to have completed the <a href="#nix-setup">NixOS setup</a> or
have a Linux system with "wget", "docker" and "docker-compose" installed.<br>

<h3>Guide</h3>
Start by running the following commands in your Server System:

Download "services-setup.sh" script

```bash
wget "https://raw.githubusercontent.com/augusto-caldas/server-automation/refs/heads/main/services-setup.sh"
```

Run script and follow with the installation

```bash
sudo bash ./services-setup.sh
```
