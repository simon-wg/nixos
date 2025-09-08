{
  description = "My NixOS flake";
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:
    {
      # NixOS System Configurations (without home-manager)
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
            ./hosts/apollo
            ./users/simon-wg/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "simon-wg@apollo" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = inputs // {
            pkgs-stable = import nixpkgs-stable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            inputs.nvf.homeManagerModules.default
            inputs.zen-browser.homeModules.default
            ./users/simon-wg/home.nix
          ];
        };
      };
    };
}
