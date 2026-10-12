# NixCraft

Nix flake packaging and development environment for [PhotoCraft](https://github.com/storytold/photocraft) and [VectorCraft](https://github.com/storytold/vectorcraft).

- **PhotoCraft**: Open-source Rust raster image editor (Photoshop alternative).
- **PhotoCraft CLI**: Headless image processing, batch automation, and MCP server.
- **VectorCraft**: Open-source Rust vector graphics editor (Illustrator alternative).
- **VectorCraft CLI**: Headless vector processing, export tooling, and MCP server.

Supported platforms: `x86_64-linux`, `aarch64-linux`.

---

## Flake Outputs

| Output Attribute | Description |
|---|---|
| `packages.<system>.photocraft` | PhotoCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.photocraft-cli` | PhotoCraft headless CLI and MCP server |
| `packages.<system>.vectorcraft` | VectorCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.vectorcraft-cli` | VectorCraft headless CLI and MCP server |
| `packages.<system>.default` | Default package (aliases `photocraft`) |
| `apps.<system>.*` | Executable flake apps corresponding to each package |
| `overlays.default` | Nixpkgs overlay providing all four packages |
| `devShells.<system>.default` | Development shell with Rust toolchain, dev tools, and graphics runtime libraries |

---

## Usage

### Running Directly (`nix run`)

Launch desktop applications:

```sh
# Run PhotoCraft GUI (default app)
nix run .
# or explicitly:
nix run .#photocraft

# Run VectorCraft GUI
nix run .#vectorcraft
```

Execute CLI tools and headless automation:

```sh
# PhotoCraft CLI
nix run .#photocraft-cli -- --help

# VectorCraft CLI
nix run .#vectorcraft-cli -- --help
```

### Building Packages (`nix build`)

Build derivations into `./result`:

```sh
# Build PhotoCraft GUI
nix build .#photocraft

# Build PhotoCraft CLI
nix build .#photocraft-cli

# Build VectorCraft GUI
nix build .#vectorcraft

# Build VectorCraft CLI
nix build .#vectorcraft-cli
```

### Development Shell (`nix develop`)

Enter the complete Rust development environment:

```sh
nix develop
```

The devShell provides:
- **Rust Toolchain**: `rustc`, `cargo`, `rust-analyzer`, `clippy`, `rustfmt`
- **Build Tools**: `pkg-config`
- **Graphics & Windowing Libraries**: `wayland`, `libxkbcommon`, `libGL`, `vulkan-loader`, `xorg` libraries (`libX11`, `libXcursor`, `libXi`, `libXrandr`, `libXcb`), `fontconfig`, `freetype`
- **Environment Variables**:
  - `RUST_SRC_PATH`: Configured to Rust standard library source for IDE/rust-analyzer navigation
  - `RUST_BACKTRACE=1`: Enhanced backtraces enabled by default
  - `LD_LIBRARY_PATH`: Pre-populated with Wayland, Vulkan, OpenGL, and X11 libraries so `cargo run` works out of the box

Execute commands directly within the shell:

```sh
nix develop --command cargo build
nix develop --command cargo test
nix develop --command cargo --version
```

---

## Model Context Protocol (MCP) Server Setup

Both `photocraft-cli` and `vectorcraft-cli` feature built-in [Model Context Protocol (MCP)](https://modelcontextprotocol.io) servers over stdio for LLM agents (Claude Code, Claude Desktop, opencode, etc.).

### PhotoCraft MCP Server

Starts a headless session providing layer tree inspection, command discovery, batch execution, and rendering previews:

```sh
photocraft-cli mcp --automation-read-root /path/to/project --automation-write-root /path/to/project
```

### VectorCraft MCP Server

Provides document inspection, shape/path drawing, SVG/PDF exports, and command automation. Supports both headless mode and live remote bridge mode:

```sh
# Headless mode (in-process engine with CPU renderer)
vectorcraft-cli mcp --headless --automation-read-root /path/to/project --automation-write-root /path/to/project

# Live remote bridge mode (connect to running desktop app started with `vectorcraft --control 7979`)
vectorcraft-cli mcp --connect 127.0.0.1:7979
```

### Client Configuration Examples

#### Claude Code CLI

```sh
# PhotoCraft MCP
claude mcp add photocraft -- photocraft-cli mcp --automation-read-root "$PWD" --automation-write-root "$PWD"

# VectorCraft MCP (headless)
claude mcp add vectorcraft -- vectorcraft-cli mcp --headless --automation-read-root "$PWD" --automation-write-root "$PWD"
```

#### JSON Configuration (`claude_desktop_config.json` / `opencode.json`)

Using binaries installed via Nix:

```json
{
  "mcpServers": {
    "photocraft": {
      "command": "photocraft-cli",
      "args": [
        "mcp",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    },
    "vectorcraft": {
      "command": "vectorcraft-cli",
      "args": [
        "mcp",
        "--headless",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    }
  }
}
```

Using `nix run` directly from the flake:

```json
{
  "mcpServers": {
    "photocraft": {
      "command": "nix",
      "args": [
        "run",
        "github:storytold/nixcraft#photocraft-cli",
        "--",
        "mcp",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    },
    "vectorcraft": {
      "command": "nix",
      "args": [
        "run",
        "github:storytold/nixcraft#vectorcraft-cli",
        "--",
        "mcp",
        "--headless",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    }
  }
}
```

---

## NixOS Integration & Overlays

You can integrate NixCraft into your NixOS or Home Manager configuration using the provided overlay.

### NixOS Flake (`flake.nix`)

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixcraft.url = "github:storytold/nixcraft";
    nixcraft.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixcraft, ... }: {
    nixosConfigurations.myhostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          nixpkgs.overlays = [
            nixcraft.overlays.default
          ];

          environment.systemPackages = with pkgs; [
            photocraft
            photocraft-cli
            vectorcraft
            vectorcraft-cli
          ];
        }
      ];
    };
  };
}
```

### Direct Package Usage (without Overlay)

```nix
environment.systemPackages = [
  nixcraft.packages.${pkgs.system}.photocraft
  nixcraft.packages.${pkgs.system}.photocraft-cli
  nixcraft.packages.${pkgs.system}.vectorcraft
  nixcraft.packages.${pkgs.system}.vectorcraft-cli
];
```
