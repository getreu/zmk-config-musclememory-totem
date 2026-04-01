{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    qmk
    git
    # Compiler für ARM (RP2040)
    gcc-arm-embedded
    # Compiler für AVR (Pro Micro)
    avrgcc
    # Python-Abhängigkeiten für QMK
    (python3.withPackages (ps: with ps; [ 
      qmk
      pyusb
      pyserial
    ]))
    # Flash-Tools
    dfu-util
    avrdude
  ];

  shellHook = ''
    # Setzt den Pfad zum QMK Firmware Repo, falls nötig
    # export QMK_HOME=$(pwd)
    echo "QMK Build Environment bereit!"
  '';
}

