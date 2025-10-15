{
  description = "My NixOS flake";
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nvf = {
      #url = "path:/home/simon-wg/Programming/Hobby/nvf";
      url = "github:NotAShelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      apollo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = "simon-wg";
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          inputs.stylix.nixosModules.stylix
          ./hosts/apollo
          ./users/simon-wg/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "simon-wg@apollo" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs =
          inputs
          // {
            pkgs-stable = import nixpkgs-stable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            username = "simon-wg";
            hostname = "apollo";
            catppuccin = import ./catppuccin.nix;
          };
        modules = [
          inputs.stylix.homeModules.stylix
          inputs.nvf.homeManagerModules.default
          inputs.zen-browser.homeModules.default
          ./users/simon-wg/home.nix
        ];
      };
    };
  };
}
