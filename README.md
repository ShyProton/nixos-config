[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# NixOS Configurations ❄️

My NixOS configuration files.

Split into global machine configurations with opt-in features, and user
configurations using [home-manager](https://github.com/nix-community/home-manager).

## Machines
- [**alphonse**](hosts/alphonse): ASUS TUF Gaming FX505DU
- [**mob**](hosts/mob): Lenovo ThinkPad T14 Gen 3 (AMD) 21CF003UUS
- [**vbox**](hosts/vbox): Virtual Machine

## Features

### Machine
- **Global features:**
  - [x] [**Opt-in persistence**](hosts/common/global/persistence.nix)
        via [Impermanence](https://github.com/nix-community/impermanence)
  - [x] [**Secrets**](hosts/common/secrets)
        via [agenix](https://github.com/ryantm/agenix)
    - [x] [**User password**](hosts/common/secrets/shayanr-password.age)
  - [x] [**Templates**](templates) for a quick start on projects
    - [x] [**Rust**](templates/rust)
    - [ ] **Python**
    - [ ] **Webdev**
  - [ ] **CI/CD** via [Hydra](https://github.com/NixOS/hydra)
- **Optional features:**
  - [x] [**Boot options**](hosts/common/optional/boot)
    - [x] [**UEFI**](hosts/common/optional/boot/efi.nix)
    - [ ] **BIOS**
  - [x] [**Persistence filesystem options**](hosts/common/optional/persistence)
    - [x] [**BTRFS**](hosts/common/optional/persistence/btrfs.nix)
    - [ ] **ZFS**
    - [ ] **TMPFS**
  - [x] **Desktop Environments** (for VMs)
    - [x] [**GNOME**](hosts/common/optional/gnome.nix)
  - [x] **System Functions**
    - [x] [**Pipewire**](hosts/common/optional/pipewire.nix) for audio
    - [x] [**NetworkManager**](hosts/common/optional/networkmanager.nix) for Wi-Fi
    - [x] [**light**](hosts/common/optional/backlight.nix) for backlight control 
    - [x] [**Bluetooth**](hosts/common/optional/bluetooth.nix)
  - [x] **Containers**
    - [x] [**Podman**](hosts/common/optional/podman.nix), with some extra 
      [user-side configuration](home/shayanr/features/cli/podman.nix)
  - [x] [**Virt-manager**](hosts/common/optional/virtualization.nix) for virtualization
  - [ ] **NVIDIA** offloading
  - [x] [**TLP**](hosts/common/optional/tlp.nix) for power management
  - [x] [**fprintd**](hosts/common/optional/fprintd.nix) for fingerprint authentication

### User(s)
- [x] [**Neovim**](home/shayanr/features/cli/nvim) 
      via [NixVim](https://github.com/pta2002/nixvim)
- [x] **Colorscheme** via [nix-colors](https://github.com/misterio77/nix-colors)
- [x] [**XDG**](home/shayanr/features/system/xdg.nix) directories
- [x] [**Wayland**](home/shayanr/features/desktop/ui/wayland)
  - [x] [**Hyprland**](home/shayanr/features/desktop/ui/wayland/hyprland)
    - [x] **NVIDIA** support
    - [x] **Swaybg** for wallpapers
  - [ ] **Sway**
  - [x] [**Waybar**](home/shayanr/features/desktop/ui/wayland/waybar) taskbar
  - [x] [**Wofi**](home/shayanr/features/desktop/ui/wayland/wofi.nix) app launcher
  - [x] [**Swaylock**](home/shayanr/features/desktop/ui/wayland/swaylock.nix) for the lockscreen
  - [x] [**Swayidle**](home/shayanr/features/desktop/ui/wayland/swayidle.nix) for idling behaviour
- [x] [**Firefox**](home/shayanr/features/desktop/apps/firefox)
  - [x] [**Settings**](home/shayanr/features/desktop/apps/firefox/settings.nix) for `about:config`
  - [x] [**Styling**](home/shayanr/features/desktop/apps/firefox/style.nix) via `userChrome.css`
  - [x] [**Extensions**](home/shayanr/features/desktop/apps/firefox/extensions.nix)
        via [firefox-addons](https://gitlab.com/rycee/nur-expressions/-/tree/master/)
- [x] [**Kitty**](home/shayanr/features/desktop/apps/kitty.nix) terminal emulator
- [x] [**Discord Canary**](home/shayanr/features/desktop/apps/discord)
  - [x] [**Styling**](home/shayanr/features/desktop/apps/discord/style.nix)
  - [x] [**OpenAsar**](https://github.com/GooseMod/OpenAsar) alternative to `app.asar`
- [x] [**WebCord**](home/shayanr/features/desktop/apps/webcord.nix) open source Discord client
- [x] [**Spotify**](home/shayanr/features/desktop/apps/spotify.nix)
  - [x] **Styling** via [spicetify-nix](https://github.com/the-argus/spicetify-nix)
- [x] **JetBrains IDEs**
  - [x] [**IntelliJ IDEA**](home/shayanr/features/desktop/apps/idea.nix)
- [x] [**GTK**](home/shayanr/features/desktop/ui/gtk.nix) settings/theme
- [x] [**Shell**](home/shayanr/features/cli/shell)
  - [x] [**Starship**](home/shayanr/features/cli/shell/prompt.nix) shell prompt
  - [x] [**ZSH**](home/shayanr/features/cli/shell/zsh.nix)
  - [x] [**Nushell**](home/shayanr/features/cli/shell/nushell)
- [x] [**Git/GH**](home/shayanr/features/cli/git.nix) for version control and repo management
- [x] [**TealDeer**](home/shayanr/features/cli/tldr.nix) for simpler manpages
- [x] [**Bat**, **Rg**](home/shayanr/features/cli/default.nix) alternatives to `cat`, `grep`
- [x] [**Direnv**](home/shayanr/features/cli/direnv.nix) for easier development environments

---
- [**Modules**](modules/home-manager)
  - [**Monitors**](modules/home-manager/monitors.nix) for monitor definitions
  - [**Wallpaper**](modules/home-manager/wallpaper.nix) for defining home and lockscreen wallpapers
  - [**Window decorations**](modules/home-manager/window-decorations.nix) for defining window styles
    such as border radius and gap size

## System details
- **Intended partition labels:**
  - `ROOT` for the root partition mounted on `/`
  - `BOOT` for the EFI boot partition mounted on `/boot`
  - `SWAP` for the swap partition
- **Intended subvolumes for `btrfs`:**
  - `root-blank` blank root snapshot used to restore clean machine state on boot
  - `root` mounted on `/`
  - `nix` mounted on `/nix`
  - `persist` mounted on `/persist`
- **Persisted directories/files on the machine level:**
  - Directories:
    - `/etc/ssh`
    - `/var/log`
    - `/var/lib/systemd`
    - `/srv`
    - `/mnt`
  - Files:
    - `/etc/machine-id`

## Notes
- It can be debated on whether or not opt-in persistence should be a global
feature for all machines; mostly up to personal preference.
I choose to implement it on all machines since I want all my systems
to be as *declarative* as possible. Any data not explicitly specified to be 
persistent, or otherwise unspecified in the configuration, should not be there.
