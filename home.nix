{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ryuz";
  home.homeDirectory = "/home/ryuz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

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
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/helix/config.toml".source = ./dotfiles/helix/config.toml;
    ".config/helix/themes/seashells.toml".source = ./dotfiles/helix/themes/seashells.toml;
    ".config/fish/config.fish".source = ./dotfiles/fish/config.fish;
    ".config/ghostty/config".source = ./dotfiles/ghostty/config;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
