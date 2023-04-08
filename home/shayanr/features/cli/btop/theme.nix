{ colors }:
''
  # Main background, empty for terminal default, need to be empty if you want transparent background
  theme[main_bg]="#${colors.base00}"

  # Main text color
  theme[main_fg]="#${colors.base06}"

  # Title color for boxes
  theme[title]="#${colors.base07}"

  # Higlight color for keyboard shortcuts
  theme[hi_fg]="#${colors.base09}"

  # Background color of selected items
  theme[selected_bg]="#${colors.base01}"

  # Foreground color of selected items
  theme[selected_fg]="#${colors.base0B}"

  # Color of inactive/disabled text
  theme[inactive_fg]="#${colors.base01}"

  # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
  theme[graph_text]="#${colors.base03}"

  # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
  theme[proc_misc]="#${colors.base0B}"

  # Cpu box outline color
  theme[cpu_box]="#${colors.base04}"

  # Memory/disks box outline color
  theme[mem_box]="#${colors.base04}"

  # Net up/down box outline color
  theme[net_box]="#${colors.base04}"

  # Processes box outline color
  theme[proc_box]="#${colors.base04}"

  # Box divider line and small boxes line color
  theme[div_line]="#${colors.base04}"

  # Temperature graph colors
  theme[temp_start]="#${colors.base0C}"
  theme[temp_mid]="#${colors.base0E}"
  theme[temp_end]="#${colors.base0F}"

  # CPU graph colors
  theme[cpu_start]="#${colors.base0A}"
  theme[cpu_mid]="#${colors.base09}"
  theme[cpu_end]="#${colors.base08}"

  # Mem/Disk free meter
  theme[free_start]="#${colors.base0B}"
  theme[free_mid]="#${colors.base0A}"
  theme[free_end]="#${colors.base09}"

  # Mem/Disk cached meter
  theme[cached_start]="#${colors.base0D}"
  theme[cached_mid]="#${colors.base0C}"
  theme[cached_end]="#${colors.base0E}"

  # Mem/Disk available meter
  theme[available_start]="#${colors.base0A}"
  theme[available_mid]="#${colors.base09}"
  theme[available_end]="#${colors.base08}"

  # Mem/Disk used meter
  theme[used_start]="#${colors.base0E}"
  theme[used_mid]="#${colors.base0F}"
  theme[used_end]="#${colors.base08}"

  # Download graph colors
  theme[download_start]="#${colors.base0D}"
  theme[download_mid]="#${colors.base0C}"
  theme[download_end]="#${colors.base0E}"

  # Upload graph colors
  theme[upload_start]="#${colors.base0C}"
  theme[upload_mid]="#${colors.base0E}"
  theme[upload_end]="#${colors.base0F}"
''
