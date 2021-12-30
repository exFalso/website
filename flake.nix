{
  description = "exfalso.com";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-21.11";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.generate = nixpkgs.legacyPackages.x86_64-linux.callPackage ./. {};
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.generate;
    apps.x86_64-linux.generate = {
      type = "app";
      program = self.packages.x86_64-linux.generate;
    };
    devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = with nixpkgs.legacyPackages.x86_64-linux; [
        zola
      ];
    };
  };
}
