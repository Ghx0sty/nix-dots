{
	description = "Hello";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};
	outputs = { self, nixpkgs, home-manager, ...}@attrs: {
		nixosConfigurations = {
			nixos = let
				pkgs = import nixpkgs {
					system = "x86_64-linux";
					config = {
						allowUnfree = true;
						allowUnfreePredicate = _: true;
					};
				};
			in
			nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
			modules = [
					./configuration.nix { nixpkgs.config.allowUnfree = true; }
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.matt = import ./home.nix;
					}
				];
			};
		};
	};
}
