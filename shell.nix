{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    uv
    git
  ];

  shellHook = ''
    # Setzt den Pfad zum QMK Firmware Repo, falls nötig
    # export QMK_HOME=$(pwd)
    echo "uv Package manager bereit!"
  '';
}

