# CLAUDE.md - Nix Configuration Project

## Project Overview
This is a comprehensive Nix configuration flake supporting multiple systems (macOS via nix-darwin and NixOS) with modular configuration management. The project uses flake-parts for organization and includes home-manager for user-specific configurations.

## Architecture
- **Flake-based**: Uses Nix flakes for reproducible builds
- **Multi-platform**: Supports x86_64-linux, aarch64-darwin, x86_64-darwin
- **Modular design**: Separate modules for Darwin, NixOS, and home-manager configurations
- **Host-specific**: Individual configurations for different machines
- **Stable + Unstable**: Uses stable nixpkgs (25.05) with unstable overlay for latest packages

## Hosts Configuration
The project manages multiple hosts:
- **nixos**: NixOS system (user: mortenhogh)
- **mini**: macOS system (user: mortenhogh) 
- **laptop**: macOS system (user: mortenhogh)
- **BDM-LW262PK2D3**: macOS work system (user: mho)

## Key Dependencies
- **nixpkgs**: Main package repository (stable 25.05 channel)
- **nixpkgs-unstable**: Unstable packages overlay
- **nix-darwin**: macOS system configuration (25.05)
- **home-manager**: User environment management (25.05)
- **nixvim**: Neovim configuration in Nix
- **sops-nix**: Secrets management
- **firefox-addons**: Firefox extension management
- **mac-app-util**: macOS app integration
- **nix-vscode-extensions**: VSCode extension management
- **pre-commit-hooks**: Git hooks for code quality

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
- `.sops.yaml`: SOPS encryption configuration

### Configuration Modules
- `modules/darwin/`: macOS-specific modules
  - `core/`: Essential Darwin configurations (nix, programs, system, user)
  - `opt/`: Optional Darwin configurations (homebrew, fonts, services)
- `modules/nixos/`: NixOS-specific modules  
  - `core/`: Essential NixOS configurations (nix, programs, system, user)
  - `opt/`: Optional NixOS configurations (packages, fonts, console)
- `modules/home/`: Home-manager modules
  - `core/`: Essential home configurations (home-manager, sops)
  - `opt/`: Optional home configurations (packages, programs, session)

### Host-Specific Configurations
- `hosts/`: Host-specific system configurations
  - `nixos/`, `mini/`, `laptop/`, `BDM-LW262PK2D3/`: Each with `default.nix` and `hardware-configuration.nix`
- `home/`: User-specific configurations per host
  - `profiles/`: Individual user profiles per host

### Additional Components
- `packages/`: Custom packages
  - `nvim/`: Comprehensive Neovim configuration via nixvim
  - `node2nix/`: Node.js package management
- `secrets/`: SOPS-encrypted secrets per host
- `pre-commit-hooks.nix`: Git hooks configuration

## Testing & Linting
The project includes pre-commit hooks and uses:
- `nixfmt-rfc-style`: Code formatting
- Development shell with common tools (git, nh, nixfmt)

## Notes
- Uses stable nixpkgs (25.05) with unstable overlay for latest packages
- Includes comprehensive Neovim configuration via nixvim with extensive plugin setup
- Secrets managed with SOPS and age encryption per host
- Firefox extensions managed declaratively
- macOS apps integrated via mac-app-util
- VSCode extensions managed via nix-vscode-extensions
- Pre-commit hooks ensure code quality with nixfmt-rfc-style formatting