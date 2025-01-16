# NIX setup

## Install NIX

Use the Determinate Systems GUI installer for Nix on a Mac. It is available [here](https://determinate.systems/posts/graphical-nix-installer/).

Use the NixOS installer for Linux. It is available [here](https://nixos.org/download.html).

Clone the NIX flakes at the home directory for Mac and /etc/nixos for NixOS.

## Install (and switch to) the NIX flakes on a Mac

```bash
cd ~/nix
nix run nix-darwin -- switch --flake . (first time)
darwin-rebuild switch --flake . (after the first time)
```

## Install (and switch to) the NIX flakes on NixOS

```bash
cd /etc/nixos
nixos-rebuild switch
```
