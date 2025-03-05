# NIX setup

## Install NIX

Use the NixOS installer for MacOS. It is available [here](https://nixos.org/download.html).
Note: Don't use Determinate Systems GUI installer for Nix on a Mac - you'll end up configuring two nix systems.

Use the NixOS installer for Linux. It is available [here](https://nixos.org/download.html).

Clone the NIX flakes at the home directory for Mac and /etc/nixos for NixOS.

## Install (and switch to) the NIX flakes on a Mac

```bash
cd ~/nix
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake . (first time)
darwin-rebuild switch --flake . (after the first time)
```

## Install (and switch to) the NIX flakes on NixOS

```bash
cd /etc/nixos
nixos-rebuild switch
```

## Update the NIX flakes

```bash
nix flake update
```

# Nvim setup

## Wrong startup file

[Auto-session](https://github.com/rmagatti/auto-session) is installed. So if you bork your startup, and nvim opens a deleted file with a ton of errors, open a new file and do:

```bash
:SessionSave
```
