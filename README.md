# NIX setup

## Install NIX

Use the Determinate Systems GUI installer for Nix on a Mac. It is available [here](https://determinate.systems/posts/graphical-nix-installer/).

Use the NixOS installer for Linux. It is available [here](https://nixos.org/download.html).

## Install the NIX flakes on a Mac

```bash
nix run nix-darwin -- switch --flake .
```

## Install the NIX flakes on NixOS

```bash
nixos-rebuild switch
```
