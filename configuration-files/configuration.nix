{ config, pkgs, ... }:
let
  vars = import ./variables.nix;  # Import the variables
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define hostname
  networking.hostName = vars.hostName; # Define your hostname.

  # Set your time zone.
  time.timeZone = vars.timeZone;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${vars.userName} = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
     shell = pkgs.bash;
     packages = with pkgs; [
       docker-compose
       htop
       tmux
       wget
     ];
   };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Setup docker  
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  # Version system was installed
  system.stateVersion = "24.11";
}
