{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    neofetch
    ghostty
    brave
    wofi
    stow
    waybar
    hyprlock
    hyprpaper
    hyprshot
    killall
    playerctl
    spotify
    hyprcursor
    rose-pine-hyprcursor
    fish
    zoxide
    protonmail-desktop
    ranger # File manager CLI
    kdePackages.okular # PDF viewer
    eog # Image preview
    nextcloud-client
    obsidian
    lutris
    lazygit
    bat
    eza
    mcfly
    fzf
    mcfly-fzf
    gnome-boxes
    gnome-extension-manager
    glib
  ];

  programs.hyprland.enable = true;
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.ly.enableGnomeKeyring = true;

  programs._1password-gui.enable = true;
  programs.git.enable = true;
  programs.steam.enable = true;
  programs.localsend.enable = true;

  # Cosmic
  #services.displayManager.cosmic-greeter.enable = true;
  #services.desktopManager.cosmic.enable = true;
  #services.desktopManager.cosmic.xwayland.enable = true;

  # Gnome
  #services.xserver = {
  #  enable = true;
  #  displayManager.gdm.enable = true;
  #  desktopManager.gnome.enable = true;
  #};

  # KDE
  #services = {
  #  desktopManager.plasma6.enable = true;
  #  displayManager.sddm.enable = true;
  #  displayManager.sddm.wayland.enable = true;
  #};
  
  # Add custom packages
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      edit
    ];
  };
 }
