''
  let-env PROMPT_INDICATOR = {|| "❯ " }
  let-env PROMPT_INDICATOR_VI_INSERT = {|| "❯ " }

  let-env PROMPT_INDICATOR_VI_NORMAL = {|| ": " }
  let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }

  let-env ENV_CONVERSIONS = {
    "PATH": {
      from_string: { |s| $s | split row (char esep) | path expand -n }
      to_string: { |v| $v | path expand -n | str join (char esep) }
    }
    "Path": {
      from_string: { |s| $s | split row (char esep) | path expand -n }
      to_string: { |v| $v | path expand -n | str join (char esep) }
    }
  }
''
