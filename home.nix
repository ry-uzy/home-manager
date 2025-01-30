{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ryuz";
  home.homeDirectory = "/home/ryuz";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    git
    gcc
    curl
    wget
    magic-wormhole
    asdf-vm
    helix
    starship
    firefox
    ghostty
    yazi
    nixpacks
    open-vm-tools
    gnomeExtensions.paperwm
    geist-font
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/helix/config.toml".source = ./dotfiles/helix/config.toml;
    ".config/helix/themes/seashells.toml".source = ./dotfiles/helix/themes/seashells.toml;
    ".config/fish/config.fish".source = ./dotfiles/fish/config.fish;
    ".config/ghostty/config".source = ./dotfiles/ghostty/config;
    ".config/yazi/yazi.toml".source = ./dotfiles/yazi/yazi.toml;
    ".config/yazi/keymap.toml".source = ./dotfiles/yazi/keymap.toml;
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
