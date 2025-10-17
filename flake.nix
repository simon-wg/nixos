{
  description = "My NixOS flake";
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-custom.url = "github:simon-wg/nixpkgs/monaspace";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nvf = {
      #url = "path:/home/simon-wg/Programming/Hobby/nvf";
      url = "github:NotAShelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    home-manager,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-custom,
    self,
    ...
  } @ inputs: {
    nixosModules = import ./modules/nixos;
    homeModules = import ./modules/home-manager;

    nixosConfigurations = {
      apollo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit self;
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          ./hosts/apollo

          inputs.stylix.nixosModules.stylix
          inputs.catppuccin.nixosModules.catppuccin
        ];
      };
    };

    homeConfigurations = {
      "simon-wg@apollo" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs =
          inputs
          // {
            inherit self;
            pkgs-stable = import nixpkgs-stable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            username = "simon-wg";
            hostname = "apollo";

            pkgs = import nixpkgs rec {
              system = "x86_64-linux";
              overlays = [
                (final: prev: {
                  monaspace = nixpkgs-custom.legacyPackages.${system}.monaspace;
                  monaspace-nerdfonts = nixpkgs-custom.legacyPackages.${system}.monaspace-nerdfonts;
                })
              ];
            };
          };
        modules = [
          ./users/simon-wg/home.nix

          inputs.stylix.homeModules.stylix
          inputs.catppuccin.homeModules.catppuccin
          inputs.nvf.homeManagerModules.default
          inputs.zen-browser.homeModules.default
        ];
      };
    };
  };
}
