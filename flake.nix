{
  description = "My NixOS flake";
  inputs = {
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
      # url = "path:/home/simon-wg/Programming/Hobby/nvf";
      url = "github:NotAShelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      home-manager,
      nixpkgs,
      nixpkgs-custom,
      self,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosModules = import ./modules/nixos;
      homeModules = import ./modules/home-manager;
      users = import ./users;

      nixosConfigurations = {
        apollo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit self;
          };
          modules = [
            ./hosts/apollo

            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.nixosModules.catppuccin

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // {
                inherit self;
                username = "simon-wg";
                hostname = "apollo";
              };

              # Add overlays for home-manager's pkgs
              nixpkgs.overlays = [
                (final: prev: {
                  inherit (import nixpkgs-custom { system = "x86_64-linux"; }) monaspace;
                })
              ];

              # Configure home-manager for your user
              home-manager.users.simon-wg = {
                imports = [
                  ./users/simon-wg/home.nix

                  inputs.stylix.homeModules.stylix
                  inputs.catppuccin.homeModules.catppuccin
                  inputs.nvf.homeManagerModules.default
                  inputs.zen-browser.homeModules.default
                ];
              };
            }
          ];
        };
      };

      homeConfigurations = {
        "simon-wg@argus" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
            overlays = [
              (final: prev: {
                inherit (import nixpkgs-custom { system = "x86_64-linux"; }) monaspace;
              })
            ];
          };
          extraSpecialArgs = inputs // {
            inherit self;
            username = "simon-wg";
            hostname = "argus";
          };
          modules = [
            ./hosts/argus/home.nix
            ./users/simon-wg/home.nix
          ];
        };
      };
    };
}
