{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    git
    zsh
    wget
    curl
    htop
    tree
    fzf
    ripgrep
    bat
    tmux
    fd
    starship
    zoxide
    lsd
    python311
    nodejs_20
    gcc
    xclip
    wl-clipboard
  ];

  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
    ];
  };

  programs.home-manager.enable = true;
}

