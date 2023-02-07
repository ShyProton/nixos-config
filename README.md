# NixOS Configurations ❄️

## Features

### Machine
- **Global:**
  - **Opt-in persistence** via [Impermanence](https://github.com/nix-community/impermanence)
  - **Secrets** via [sops-nix](https://github.com/Mic92/sops-nix)
  - **TODO:** [Hydra CI/CD](https://github.com/NixOS/hydra)
- **Optional:**
  - **TODO:** Ablility to choose between btrfs/zfs/tmpfs... 
    for opt-in persistence 

### User(s)
- **shayanr:**
  - **Neovim** via [NixVim](https://github.com/pta2002/nixvim)
  - **TODO:** Hyprland (w/nvidia)
  - **TODO:** Firefox
  - **TODO:** Kitty

## Notes
- It can be debated on whether or not opt-in persistence should be a global
feature for all machines; mostly up to personal preference.
I choose to implement it on all machines since I want all my systems
to be as *declarative* as possible. Any data not explicitly specified to be 
persistent, or otherwise unspecified in the configuration, should not be there.
