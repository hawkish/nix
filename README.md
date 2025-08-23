# Nix Configuration Flake

A comprehensive Nix configuration flake supporting multiple systems (macOS via nix-darwin and NixOS) with modular configuration management.

## Features

- **Multi-platform**: Supports x86_64-linux, aarch64-darwin, x86_64-darwin
- **Stable + Unstable**: Uses stable nixpkgs (25.05) with unstable overlay
- **Modular design**: Separate modules for Darwin, NixOS, and home-manager
- **Host-specific configurations**: Individual setups for different machines
- **Comprehensive Neovim**: Full nixvim configuration with extensive plugins
- **Secrets management**: SOPS with age encryption per host
- **Code quality**: Pre-commit hooks with nixfmt-rfc-style formatting

## Hosts

- **nixos**: NixOS system (user: mortenhogh)
- **mini**: macOS system (user: mortenhogh)
- **laptop**: macOS system (user: mortenhogh)
- **BDM-LW262PK2D3**: macOS work system (user: mho)

## Installation

### Prerequisites

Install Nix using the official installer:

- **macOS**: Use the NixOS installer from [nixos.org](https://nixos.org/download.html)
- **Linux**: Use the NixOS installer from [nixos.org](https://nixos.org/download.html)

**Note**: Don't use Determinate Systems GUI installer for Nix on macOS - you'll end up configuring two nix systems.

### Clone Repository

- **macOS**: Clone to `~/nix`
- **NixOS**: Clone to `/etc/nixos`

## System Setup

### macOS (Darwin)

```bash
# First time setup
cd ~/nix
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .

# Subsequent rebuilds
darwin-rebuild switch --flake .
```

### NixOS

```bash
cd /etc/nixos
nixos-rebuild switch
```

### Using nh

```bash
nh switch --flake .
```

## Maintenance

### Update Dependencies

```bash
# Update flake inputs
nix flake update

# Update with GitHub token for higher rate limits
nix flake update --option access-tokens "github.com=$(gh auth token)"
```

### Garbage Collection

```bash
# macOS
sudo darwin-rebuild --list-generations
sudo nix-collect-garbage -d

# NixOS
sudo nix-collect-garbage -d

# nh
nh clean all
```

Note: If you encounter `Operation not permitted` issues with garbage collection, you might need to add the terminal app (in this repo Kitty) to System > Privacy & Security > App Management

### Development

```bash
# Enter development shell with tools
nix develop

# Check flake
nix flake check

# Format code
nix fmt
```

### Troubleshooting

#### Pre-commit Hook Issues

If you encounter errors like `.git/hooks/pre-commit: No such file or directory`, the hooks may reference outdated nix store paths:

```bash
# Remove conflicting git configuration
git config --unset-all core.hooksPath

# Reinstall hooks with current nix store paths
nix develop --command pre-commit install
```

## SOPS Secrets Management

### Initial Setup

1. Create SOPS configuration directory and generate age key:

```bash
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
```

2. Add the public key to `.sops.yaml` for your hostname

3. Create and edit secrets file:

```bash
nix-shell -p sops --run "sops secrets/[hostname]/secrets.json"
```

### Configured Hosts

The `.sops.yaml` file includes keys for:

- **laptop**: `age1asklk3k2t8nkc9vsrw7la2ehqlpxcv34eq0v086lj5ms0a7xluvqp6pelf`
- **mini**: `age1mzjnjcltj9wrka2pdyzw6qcuuvkp8k6d5hdjm6435ss4zdnsyppqzd98n6`
- **nixos**: `age1t32qkvxsxtctlg602s8fd5v7jcdcd6n9lvn9tq20ullw65wfuc7q7yn3zp`
- **BDM-LW262PK2D3**: `age1nzxqs34s5fn7hse7t9dqr7d7mmwz0aqcjy4mcq57w570sms8332q3kxcde`

## Neovim Configuration

The configuration includes a comprehensive Neovim setup via nixvim with:

- LSP support with conform and lint
- Completion with cmp and copilot
- Git integration with lazygit and diffview
- UI enhancements with lualine, noice, and telescope
- Treesitter for syntax highlighting
- Auto-session for session management

### Auto-session Recovery

If Neovim opens with errors due to a corrupted session, open a new file and save the session:

```bash
:SessionSave
```

## Project Structure

```
├── flake.nix              # Main flake configuration
├── hosts/                 # Host-specific configurations
│   ├── nixos/            # NixOS system
│   ├── mini/             # macOS mini
│   ├── laptop/           # macOS laptop
│   └── BDM-LW262PK2D3/   # macOS work system
├── modules/               # Modular configurations
│   ├── darwin/           # macOS modules
│   ├── nixos/            # NixOS modules
│   └── home/             # Home-manager modules
├── home/                  # User-specific configurations
├── packages/              # Custom packages
│   ├── nvim/             # Neovim configuration
│   └── node2nix/         # Node.js packages
├── secrets/               # SOPS encrypted secrets
└── pre-commit-hooks.nix   # Code quality hooks
```
