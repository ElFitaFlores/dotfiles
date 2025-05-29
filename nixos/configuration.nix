# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Bootloader.
#  boot.loader.grub.enable = true;
#  boot.loader.grub.device = "/dev/sdb1";
#  boot.loader.grub.useOSProber = true;
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
#  boot.initrd.secrets = {
#    "/boot/crypto_keyfile.bin" = null;
#  };

 # boot.loader.grub.enableCryptodisk = true;

 # boot.initrd.luks.devices."luks-4bce4da8-2dcd-4be1-83cc-8d075951848d".keyFile = "/boot/crypto_keyfile.bin";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fita = {
    isNormalUser = true;
    description = "Rafael";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
#      zoxide
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    neofetch
    #kitty
    ghostty
    brave
    wofi
    stow
    waybar
    hyprlock
    hyprpaper
    killall
    playerctl
    spotify
  ];

  programs.hyprland.enable = true;
  services.displayManager.ly.enable = true;
  programs._1password-gui.enable = true;
  programs.git.enable = true;
  #programs.zoxide = {
  #  enable = true;
    #enableBashIntegration= true;
  #};
  
  #programs.git = {
  #  enable = true;
  #  userName  = "Rafael Flores";
  #  userEmail = "21326800+ElFitaFlores@users.noreply.github.com";
  #};
  
  fonts.packages = with pkgs; [
    texlivePackages.fontawesome
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
