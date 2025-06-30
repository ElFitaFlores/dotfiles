{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
  ];

  #programs.hyprland.enable = true;
  #services.displayManager.ly.enable = true;
  #services.gnome.gnome-keyring.enable = true;
  #security.pam.services.ly.enableGnomeKeyring = true;
  programs._1password-gui.enable = true;
  programs.git.enable = true;
  programs.steam.enable = true;
  programs.localsend.enable = true;

  # Cosmic
  # Enable the login manager
  #services.displayManager.cosmic-greeter.enable = true;
  # Enable the COSMIC DE itself
  #services.desktopManager.cosmic.enable = true;
  # Enable XWayland support in COSMIC
  #services.desktopManager.cosmic.xwayland.enable = true;

  # Gnome
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Add custom packages
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      edit
    ];
  };
 }
