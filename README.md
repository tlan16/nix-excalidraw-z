# nix-excalidraw-z

Nix flake packaging [ExcalidrawZ](https://github.com/chocoford/ExcalidrawZ) — the native macOS Excalidraw client built with SwiftUI.

> **macOS aarch64 (Apple Silicon) only.** The upstream project ships a single universal/ARM DMG; this flake installs it as-is from the GitHub release.

## Usage

### Run without installing

```sh
nix run github:tlan16/nix-excalidraw-z
```

### Install into a profile

```sh
nix profile install github:tlan16/nix-excalidraw-z
```

### Use in a `home-manager` or system flake

```nix
{
  inputs.nix-excalidraw-z.url = "github:tlan16/nix-excalidraw-z";

  # then reference the package:
  # nix-excalidraw-z.packages.aarch64-darwin.default
}
```

## Build locally

```sh
git clone https://github.com/tlan16/nix-excalidraw-z
cd nix-excalidraw-z
nix build
open result/Applications/ExcalidrawZ.app
```

## Updating

1. Find the new DMG URL and SHA-256 digest from the [Releases page](https://github.com/chocoford/ExcalidrawZ/releases).
2. Update `version` and `hash` in [package.nix](package.nix).
3. Run `nix flake lock --update-input nixpkgs` if needed, then rebuild.
