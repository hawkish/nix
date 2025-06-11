# CLAUDE.md - Nix Configuration Project

## Project Overview
This is a comprehensive Nix configuration flake supporting multiple systems (macOS via nix-darwin and NixOS) with modular configuration management. The project uses flake-parts for organization and includes home-manager for user-specific configurations.

## Architecture
- **Flake-based**: Uses Nix flakes for reproducible builds
- **Multi-platform**: Supports x86_64-linux, aarch64-darwin, x86_64-darwin
- **Modular design**: Separate modules for Darwin, NixOS, and home-manager configurations
- **Host-specific**: Individual configurations for different machines

## Hosts Configuration
The project manages multiple hosts:
- **nixos**: NixOS system (user: mortenhogh)
- **mini**: macOS system (user: mortenhogh) 
- **laptop**: macOS system (user: mortenhogh)
- **BDM-LW262PK2D3**: macOS work system (user: mho)

## Key Dependencies
- **nixpkgs**: Main package repository (unstable channel)
- **nix-darwin**: macOS system configuration
- **home-manager**: User environment management
- **nixvim**: Neovim configuration in Nix
- **sops-nix**: Secrets management
- **firefox-addons**: Firefox extension management
- **mac-app-util**: macOS app integration

## Common Commands

### System Rebuild
```bash
# macOS (first time setup)
cd ~/nix
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .

# macOS (subsequent rebuilds)
darwin-rebuild switch --flake .

# NixOS
cd /etc/nixos
nixos-rebuild switch
```

### Maintenance
```bash
# Update flake inputs
nix flake update

# Garbage collection (macOS)
sudo darwin-rebuild --list-generations
sudo nix-collect-garbage -d

# Format Nix files
nix fmt
```

### Development
```bash
# Enter development shell
nix develop

# Check flake
nix flake check
```

### SOPS (Secrets Management)
```bash
# Setup age key
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt

# Edit secrets for a host
nix-shell -p sops --run "sops secrets/[hostname]/secrets.json"
```

## Directory Structure

### Core Files
- `flake.nix`: Main flake configuration
- `configuration.nix`: Currently empty, legacy file
- `flake.lock`: Locked input versions

### Configuration Modules
- `modules/darwin/`: macOS-specific modules
- `modules/nixos/`: NixOS-specific modules  
- `modules/home/`: Home-manager modules
- `hosts/`: Host-specific configurations
- `home/`: User-specific configurations per host

### Additional Components
- `packages/`: Custom packages (includes Neovim config)
- `secrets/`: SOPS-encrypted secrets per host
- `pre-commit-hooks.nix`: Git hooks configuration

## Testing & Linting
The project includes pre-commit hooks and uses:
- `nixfmt-rfc-style`: Code formatting
- Development shell with common tools (git, nh, nixfmt)

## Notes
- Uses unstable nixpkgs channel for latest packages
- Includes comprehensive Neovim configuration via nixvim
- Secrets managed with SOPS and age encryption
- Firefox extensions managed declaratively
- macOS apps integrated via mac-app-util