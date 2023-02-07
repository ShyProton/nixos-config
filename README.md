# NixOS Configurations ❄️

## Features

### Machine
- **Global:**
  - **Opt-in persistence** via *Impermanence*
  - **Secrets** via *sops-nix*
  - **TODO:** Hydra CI/CD
- **Optional:**
  - **TODO:** Ablility to choose between btrfs/zfs/tmpfs... 
    for opt-in persistence 

### User(s)
- **shayanr:**
  - **Neovim** via *NixVim*
  - **TODO:** Hyprland (w/nvidia)
  - **TODO:** Firefox
  - **TODO:** Kitty

## Notes
- It can be debated on whether or not opt-in persistence should be a global
feature for all machines; mostly up to personal preference.
I choose to implement it on all machines since I want all my systems
to be as *declarative* as possible. Any data not explicitly specified to be 
persistent, or otherwise unspecified in the configuration, should not be there.
