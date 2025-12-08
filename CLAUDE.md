# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for Arch Linux on Wayland, with cross-platform compatibility for macOS. The repository has transitioned to be primarily maintained as reference since the switch to NixOS-config.

## Architecture

The repository is organized into several key directories:

- `home-manager/` - Nix Home Manager configuration using flakes
- `python/` - Python development environment with uv package management
- `aider/` - AI coding assistant configurations and model scripts
- `conventions/` - Development conventions and style guides
- `archived_configs/` - Historical configuration files for past applications

### Home Manager (Nix)

The `home-manager/` directory contains a Nix flake-based configuration managed by just commands:

- Configuration managed via `flake.nix` with nixpkgs unstable
- Uses stylix for theming and home-manager for user environment
- Key operations done with `just` commands from the justfile

### Python Environment

The `python/` directory contains a uv-managed Python project:

- Uses uv for dependency management (not pip directly)
- Configured with development groups: `dev`, `lint`, `security`
- Follows modern Python practices with type hints and functional programming
- Pre-configured with ruff for linting and ty for type checking

## Common Development Commands

### Home Manager Operations

```bash
# Apply home manager configuration
just home

# Rebuild NixOS system (if applicable)
just switch

# Update all flake inputs
just up

# Format Nix code
just fmt

# Clean up old generations
just cleanup

# Garbage collection
just gc
```

### Python Development

```bash
# Install dependencies for development and linting
uv sync --all-groups

# Run linting
uv run ruff check .
uv run ty .

# Run tests
uv run pytest

# Check dependencies
uv run deptry .
```

### Installation

```bash
# Initial system bootstrap
cd repos/dot/.install
./system_bootstrap.sh
```

## Development Conventions

This repository follows specific conventions found in `conventions/`:

- **Python**: Modern Python with type hints, functional programming, polars over pandas
- **Git**: Standard git workflow with conventional commits
- **General**: YAGNI and KISS principles, strict interpretation of requirements

## Tool Configuration

- **Package Management**: uv for Python, nix for system packages
- **Linting**: ruff for Python, nix fmt for Nix files
- **Security**: bandit, detect-secrets, trufflehog available in security group
- **AI Assistant**: Aider configurations available in `aider/` directory
