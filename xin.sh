#!/bin/sh

if [ "$1" = "search" ]; then
  nix-env -qa $2
elif [ "$1" = "update" ]; then
  nix-channel -u
elif [ "$1" = "upgrade" ]; then
  nix-env -u
elif [ "$1" = "install" ]; then
  nix-env -iA nixpkgs.$2
elif [ "$1" = "uninstall" ]; then
  nix-env -e $2
elif [ "$1" = "shell" ]; then
  nix-shell
else
  echo "Usage:
  xin command [argument]

  Commands:
    search\t\tSearch for packages
    update\t\tUpdate the Nix channel
    upgrade\t\tCreate a new user environment
    install\t\tInstall a package globally
    uninstall\t\tUninstall a package globally
    shell\t\tOpen up the Nix shell in the CWD
  "
fi
