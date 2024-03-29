{
  description = "Qt6 project";
  nixConfig.bash-prompt = "\\[\\033[01;32m\\][nix-develop:\\w]$ \\[\\033[00m\\]";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      {
        devShells.${system}.default =
          pkgs.mkShell
            {
              hardeningDisable = [ "all" ];
              nativeBuildInputs = with pkgs; [
                pkg-config
                gcc
                gnumake
                cmake
                ninja
                clang-tools
                valgrind
              ];
              buildInputs = with pkgs.buildPackages; [
                qt6.qtbase
                qt6.qtmultimedia
              ];
              
              QT_PLUGIN_PATH="${pkgs.qt6.qtmultimedia}/lib/qt-6/plugins";
            };
      };

}
