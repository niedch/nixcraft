# NixCraft

Nix flake packaging and unified development environment for the **Storytold Craft App Suite** — a comprehensive collection of 13 open-source, high-performance creative and productivity applications written in Rust.

NixCraft provides reproducible builds, Wayland/X11 runtime wrappers, desktop integration assets (icons, desktop entries, MIME associations), headless automation CLIs with built-in [Model Context Protocol (MCP)](https://modelcontextprotocol.io) servers for AI assistants, Nixpkgs overlays, and a development shell with graphics and audio toolchains.

Supported platforms: `x86_64-linux`, `aarch64-linux`.

---

## Storytold Craft App Suite

The suite comprises 13 applications spanning digital image editing, vector graphics, motion design, video/audio production, desktop publishing, technical drafting, office productivity, and unified suite launching:

| Application | Desktop Package | CLI / MCP Package | Version | Creative Domain / Proprietary Alternative | Key Capabilities |
|---|---|---|---|---|---|
| **PhotoCraft** | `photocraft` | `photocraft-cli` | 0.8.0 | Raster Image Editor *(Adobe Photoshop)* | Non-destructive layer engine, masks, blend modes, adjustments, filters, RAW/HEIF/.psd/.pcraft support |
| **VectorCraft** | `vectorcraft` | `vectorcraft-cli` | 0.10.0 | Vector Illustration *(Adobe Illustrator)* | Bézier paths, boolean path ops, stroke styling, typography, SVG/PDF render and export |
| **DeckCraft** | `deckcraft` | `deckcraft-cli` | 0.6.0 | Presentations *(Microsoft PowerPoint / Keynote)* | Slide design, vector components, speaker notes, slide transitions, PDF/HTML presentation export |
| **GridCraft** | `gridcraft` | `gridcraft-cli` | 0.6.0 | Spreadsheets *(Microsoft Excel)* | High-performance grid computation, formula evaluation, charts, CSV/XLSX interoperability |
| **WordCraft** | `wordcraft` | `wordcraft-cli` | 0.6.0 | Word Processing *(Microsoft Word)* | Document authoring, rich typography, styles, tables, DOCX/ODT/Markdown import and export |
| **CadCraft** | `cadcraft` | `cadcraft-cli` | 0.6.1 | 2D CAD Drafting *(AutoCAD)* | Precision drafting, geometric constraints, dimensional geometry, layers, DXF/DWG/SVG export |
| **LightCraft** | `lightcraft` | `lightcraft-cli` | 0.7.0 | RAW Photo Processor *(Adobe Lightroom)* | Non-destructive RAW processing, exposure/tone grading, lens corrections, HEIF support, photo cataloging |
| **SoundCraft** | `soundcraft` | `soundcraft-cli` | 0.6.0 | Digital Audio Workstation *(Pro Tools / Ableton)* | Multi-track audio timeline, mixing, waveform editing, ALSA audio integration, session management |
| **DesignCraft** | `designcraft` | `designcraft-cli` | 0.7.0 | Desktop Publishing *(Adobe InDesign)* | Multi-page layout, master pages, typography grid, print-ready CMYK color, PDF/EPUB publishing |
| **FilmCraft** | `filmcraft` | `filmcraft-cli` | 0.7.0 | Non-Linear Video Editor *(Premiere / DaVinci Resolve)* | Multi-track video/audio timeline, transitions, color grading, media probing, rendering pipeline |
| **EffectCraft** | `effectcraft` | `effectcraft-cli` | 0.9.0 | VFX & Motion Graphics *(Adobe After Effects)* | Motion graphics, keyframe animation, visual compositing, video codecs, particle effects |
| **PdfCraft** | `pdfcraft` | `pdfcraft-cli` | 0.7.0 | PDF Editor & Reader *(Adobe Acrobat Pro)* | PDF viewing, page manipulation (split/merge/rotate), annotations, form filling, text extraction |
| **Craft Launcher** | `craft-launcher` | *N/A (GUI hub)* | 0.3.2 | Suite Launcher *(Creative Cloud Desktop)* | Unified application hub to discover, install, update, and launch all Craft suite tools |

---

## Flake Outputs

### Packages (`packages.<system>.*`)

Each creative application provides both a graphical desktop application and a headless CLI / automation tool (with the exception of Craft Launcher, which is a desktop application hub).

| Package Attribute | Description |
|---|---|
| `packages.<system>.photocraft` | PhotoCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.photocraft-cli` | PhotoCraft headless CLI and MCP server |
| `packages.<system>.vectorcraft` | VectorCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.vectorcraft-cli` | VectorCraft headless CLI and MCP server |
| `packages.<system>.deckcraft` | DeckCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.deckcraft-cli` | DeckCraft headless CLI and MCP server |
| `packages.<system>.gridcraft` | GridCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.gridcraft-cli` | GridCraft headless CLI and MCP server |
| `packages.<system>.wordcraft` | WordCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.wordcraft-cli` | WordCraft headless CLI and MCP server |
| `packages.<system>.cadcraft` | CadCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.cadcraft-cli` | CadCraft headless CLI and MCP server |
| `packages.<system>.lightcraft` | LightCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.lightcraft-cli` | LightCraft headless CLI and MCP server |
| `packages.<system>.soundcraft` | SoundCraft desktop application with ALSA and audio wrappers |
| `packages.<system>.soundcraft-cli` | SoundCraft headless CLI and MCP server |
| `packages.<system>.designcraft` | DesignCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.designcraft-cli` | DesignCraft headless CLI and MCP server |
| `packages.<system>.filmcraft` | FilmCraft desktop application with video/audio wrappers |
| `packages.<system>.filmcraft-cli` | FilmCraft headless CLI and MCP server |
| `packages.<system>.effectcraft` | EffectCraft desktop application with graphics wrappers |
| `packages.<system>.effectcraft-cli` | EffectCraft headless CLI and MCP server |
| `packages.<system>.pdfcraft` | PdfCraft desktop application with Wayland/X11 wrappers |
| `packages.<system>.pdfcraft-cli` | PdfCraft headless CLI and MCP server |
| `packages.<system>.craft-launcher` | ArtCraft Launcher desktop application (`artcraft-launcher`) |
| `packages.<system>.default` | Default package (aliases `photocraft`) |

### Apps (`apps.<system>.*`)

Executable flake apps corresponding to all packages above, allowing direct execution via `nix run`:

- Desktop Apps: `photocraft`, `vectorcraft`, `deckcraft`, `gridcraft`, `wordcraft`, `cadcraft`, `lightcraft`, `soundcraft`, `designcraft`, `filmcraft`, `effectcraft`, `pdfcraft`, `craft-launcher`, `default`
- CLI Apps: `photocraft-cli`, `vectorcraft-cli`, `deckcraft-cli`, `gridcraft-cli`, `wordcraft-cli`, `cadcraft-cli`, `lightcraft-cli`, `soundcraft-cli`, `designcraft-cli`, `filmcraft-cli`, `effectcraft-cli`, `pdfcraft-cli`

### Overlays (`overlays.default`)

The flake overlay exports all 25 individual applications, the default package, and the shared build helper function `mkCraftApp` for extending or customizing derivations.

### Development Shell (`devShells.<system>.default`)

A unified Rust development environment equipped with compilers, analysis tooling, and all necessary runtime libraries for building and running GUI and headless applications.

---

## Usage

### Running Directly (`nix run`)

Launch desktop GUI applications:

```sh
# Run default application (PhotoCraft)
nix run .

# Run specific desktop applications
nix run .#photocraft
nix run .#vectorcraft
nix run .#cadcraft
nix run .#designcraft
nix run .#filmcraft
nix run .#craft-launcher
```

Execute headless CLI tools and automation commands:

```sh
# Help and CLI documentation
nix run .#photocraft-cli -- --help
nix run .#cadcraft-cli -- --help
nix run .#gridcraft-cli -- --help

# Image format conversion with PhotoCraft CLI
nix run .#photocraft-cli -- convert input.psd output.png

# CadCraft CAD inspection and DXF export
nix run .#cadcraft-cli -- convert drawing.dwg drawing.dxf

# DeckCraft slide deck rendering
nix run .#deckcraft-cli -- render presentation.deck slides.pdf
```

### Building Packages (`nix build`)

Build derivations into `./result`:

```sh
# Build default package (PhotoCraft GUI)
nix build .

# Build specific desktop applications
nix build .#photocraft
nix build .#vectorcraft
nix build .#cadcraft
nix build .#craft-launcher

# Build headless CLIs
nix build .#photocraft-cli
nix build .#cadcraft-cli
nix build .#pdfcraft-cli

# Inspect the built output
./result/bin/photocraft-cli --help
```

### Development Shell (`nix develop`)

Enter the complete Rust development environment:

```sh
nix develop
```

The development shell provides:
- **Rust Toolchain**: `rustc`, `cargo`, `rust-analyzer`, `clippy`, `rustfmt`
- **Build Utilities**: `pkg-config`
- **Graphics & Windowing Libraries**: `wayland`, `libxkbcommon`, `libGL`, `vulkan-loader`, `xorg` (`libX11`, `libXcursor`, `libXi`, `libXrandr`, `libXcb`)
- **Font & Text Libraries**: `fontconfig`, `freetype`
- **Audio Libraries**: `alsa-lib`
- **Environment Variables**:
  - `RUST_SRC_PATH`: Configured to Rust standard library sources for IDE and `rust-analyzer` navigation
  - `RUST_BACKTRACE=1`: Enhanced backtraces enabled by default
  - `LD_LIBRARY_PATH`: Pre-populated with Wayland, Vulkan, OpenGL, ALSA, and X11 libraries so `cargo run` works out of the box

Execute commands directly within the development shell:

```sh
nix develop --command cargo --version
nix develop --command cargo build
nix develop --command cargo test
```

---

## Model Context Protocol (MCP) Server Setup

All 12 headless CLI tools (`photocraft-cli`, `vectorcraft-cli`, `cadcraft-cli`, `designcraft-cli`, `deckcraft-cli`, `gridcraft-cli`, `wordcraft-cli`, `lightcraft-cli`, `soundcraft-cli`, `filmcraft-cli`, `effectcraft-cli`, `pdfcraft-cli`) feature built-in [Model Context Protocol (MCP)](https://modelcontextprotocol.io) servers over `stdio`.

This allows AI assistants (Claude Code, Claude Desktop, opencode, Cursor, etc.) to programmatically inspect documents, draw vector primitives, edit spreadsheets, evaluate formulas, render animations, and automate creative workflows.

### Operating Modes

1. **Headless Engine Mode**: Operates directly in-process via CLI with headless rendering and processing:
   ```sh
   photocraft-cli mcp --automation-read-root "$PWD" --automation-write-root "$PWD"
   ```
2. **Live Remote Bridge Mode**: Bridges to a running desktop application instance:
   ```sh
   # Launch the desktop app with control port enabled
   vectorcraft --control 7979

   # Connect the MCP server to the running app
   vectorcraft-cli mcp --connect 127.0.0.1:7979
   ```

### Security Options

For safety when running automated agent workflows, file system access can be restricted:
- `--automation-read-root <path>`: Restrict document reading to a specific directory tree.
- `--automation-write-root <path>`: Restrict document writing and exports to a specific directory tree.
- `--control-token <token>`: Require an authentication token for remote bridge connections.

### AI Assistant Client Configurations

#### Claude Code CLI

Add MCP servers to your Claude Code environment using the `claude mcp add` command:

```sh
# PhotoCraft MCP
claude mcp add photocraft -- photocraft-cli mcp --automation-read-root "$PWD" --automation-write-root "$PWD"

# VectorCraft MCP
claude mcp add vectorcraft -- vectorcraft-cli mcp --headless --automation-read-root "$PWD" --automation-write-root "$PWD"

# CadCraft MCP
claude mcp add cadcraft -- cadcraft-cli mcp --automation-read-root "$PWD" --automation-write-root "$PWD"

# DesignCraft MCP
claude mcp add designcraft -- designcraft-cli mcp --automation-read-root "$PWD" --automation-write-root "$PWD"
```

#### JSON Configuration (`claude_desktop_config.json` / `opencode.json`)

##### Using Installed Binaries

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
    },
    "cadcraft": {
      "command": "cadcraft-cli",
      "args": [
        "mcp",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    },
    "designcraft": {
      "command": "designcraft-cli",
      "args": [
        "mcp",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    },
    "gridcraft": {
      "command": "gridcraft-cli",
      "args": [
        "mcp",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    },
    "pdfcraft": {
      "command": "pdfcraft-cli",
      "args": [
        "mcp",
        "--automation-read-root",
        "/path/to/workspace",
        "--automation-write-root",
        "/path/to/workspace"
      ]
    }
  }
}
```

##### Using `nix run` Directly from the Flake

You can also run MCP servers directly without pre-installing the packages:

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
    },
    "cadcraft": {
      "command": "nix",
      "args": [
        "run",
        "github:storytold/nixcraft#cadcraft-cli",
        "--",
        "mcp",
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

## NixOS & Home Manager Integration

Integrate the Craft App Suite into your NixOS or Home Manager configuration using the provided overlay.

### NixOS Flake Configuration (`flake.nix`)

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
            # Creative Suite Desktop Applications
            photocraft
            vectorcraft
            cadcraft
            lightcraft
            soundcraft
            designcraft
            filmcraft
            effectcraft
            pdfcraft
            craft-launcher

            # Office & Document Applications
            deckcraft
            gridcraft
            wordcraft

            # Automation & MCP CLI Tools
            photocraft-cli
            vectorcraft-cli
            cadcraft-cli
            designcraft-cli
            gridcraft-cli
            pdfcraft-cli
          ];
        }
      ];
    };
  };
}
```

### Home Manager Integration (`home.nix`)

```nix
{ pkgs, ... }: {
  nixpkgs.overlays = [
    # Reference to nixcraft.overlays.default from flake inputs
  ];

  home.packages = with pkgs; [
    # Desktop applications
    photocraft
    vectorcraft
    cadcraft
    craft-launcher

    # CLI and MCP automation tools
    photocraft-cli
    vectorcraft-cli
    cadcraft-cli
  ];
}
```

### Direct Package Usage (without Overlay)

You can also reference packages directly from the flake input without applying an overlay:

```nix
environment.systemPackages = [
  nixcraft.packages.${pkgs.system}.photocraft
  nixcraft.packages.${pkgs.system}.photocraft-cli
  nixcraft.packages.${pkgs.system}.vectorcraft
  nixcraft.packages.${pkgs.system}.vectorcraft-cli
  nixcraft.packages.${pkgs.system}.cadcraft
  nixcraft.packages.${pkgs.system}.cadcraft-cli
  nixcraft.packages.${pkgs.system}.craft-launcher
];
```

---

## Desktop Integration

Desktop applications built by NixCraft automatically include full Linux desktop environment integration:
- **Wayland & X11 Runtime Wrappers**: Dynamic loader paths configured for Wayland, Vulkan, OpenGL, and X11 libraries.
- **ALSA Audio Integration**: SoundCraft and FilmCraft include ALSA library configuration for low-latency audio.
- **Desktop Entries (`.desktop`)**: Installed into `$out/share/applications/` with standard category definitions.
- **MIME Types (`.xml`)**: Installed into `$out/share/mime/packages/` for system file association.
- **App Icons**: High-resolution and hicolor icon themes installed into `$out/share/icons/`.
- **AppStream Metainfo**: Standard metainfo descriptors installed into `$out/share/metainfo/`.
