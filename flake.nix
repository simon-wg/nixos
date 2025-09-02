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
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "path:./nixvim";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        apollo =
          let
            username = "simon-wg";
            system = "x86_64-linux";
            specialArgs = {
              inherit username;
              pkgs-stable = import nixpkgs-stable {
                inherit system;
                config.allowUnfree = true;
              };
              inputs = {
                inherit (inputs) zen-browser;
                inherit (inputs) quickshell;
                inherit (inputs) nixvim;
              };
            };
          in
          nixpkgs.lib.nixosSystem {
            inherit system;
            inherit specialArgs;
            modules = [
              ./hosts/apollo
              ./users/${username}/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = inputs // specialArgs;
                  users.${username} = import ./users/${username}/home.nix;
                };
              }
            ];
          };
      };
    };
}
