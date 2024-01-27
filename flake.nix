{
  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
      name = "hello-world-lib";
      src = ./.;
      buildPhase = ''
        cc -c ./src/hello_world.c
      '';

      installPhase = ''
        mkdir -p $out
        mv hello_world.o $out/
      '';
    };
  };
}
