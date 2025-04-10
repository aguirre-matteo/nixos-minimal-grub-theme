{
  outputs = { self, ... }: {
    package = import ./package.nix;
  };
}
