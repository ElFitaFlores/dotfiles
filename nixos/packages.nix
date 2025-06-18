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
    killall
    playerctl
    spotify
    localsend
    hyprcursor
    rose-pine-hyprcursor
    fish
    zoxide
    protonmail-desktop
    ranger # File manager CLI
    kdePackages.okular # PDF viewer
    nextcloud-client
    obsidian
    lutris
    lazygit
    bat
    eza
    mcfly
    fzf
    mcfly-fzf
  ];

  programs.hyprland.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.displayManager.ly = {
    enable = true;
  };
  security.pam.services.ly.enableGnomeKeyring = true;
  programs._1password-gui.enable = true;
  programs.git.enable = true;
  programs.steam.enable = true;
 }
