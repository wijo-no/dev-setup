homeConfigurations."william@ubuntu" = home-manager.lib.homeManagerConfiguration {
  pkgs = import nixpkgs { system = "x86_64-linux"; };
  extraSpecialArgs = { inherit inputs; };
  modules = [
    ./shared/home.nix
    ./users/william/william.nix
  ];
};

homeConfigurations."jos@ubuntu" = home-manager.lib.homeManagerConfiguration {
  pkgs = import nixpkgs { system = "x86_64-linux"; };
  extraSpecialArgs = { inherit inputs; };
  modules = [
    ./shared/home.nix
    ./users/sebastian/jos.nix
  ];
};

