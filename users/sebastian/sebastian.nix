
{ config, lib, pkgs, inputs, ... }:

let
  dotfiles = "/home/shared/nix/users/sebastian/dotfiles/";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
  symlinkFiles = {
    ".zshrc" = ".zshrc";
    ".config/nvim" = "nvim";
    ".config/kitty" = "kitty";
  };
  homeFileConfig = builtins.listToAttrs (map (name: {
    name = name;
    value.source = mkSymlink symlinkFiles.${name};
  }) (builtins.attrNames symlinkFiles));
in
{
  home.username = "jos";
  home.homeDirectory = "/home/jos";
  home.stateVersion = "24.11";
  home.file = homeFileConfig;
  home.packages = with pkgs; [



  ];
}

