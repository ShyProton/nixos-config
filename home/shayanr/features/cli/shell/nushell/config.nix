''
  alias cat = bat

  let dark_theme = {
    # color for nushell primitives
    separator: white
    # no fg, no bg, attr none effectively turns this off
    leading_trailing_space_bg: { attr: n }
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    bool: {|| if $in { 'light_cyan' } else { 'light_gray' } }
    int: white

    filesize: {|e|
      if $e == 0b {
        'white'
      } else if $e < 1mb {
        'cyan'
      } else { 'blue' }
    }

    duration: white

    date: {|| (date now) - $in |
      if $in < 1hr {
        'red3b'
      } else if $in < 6hr {
        'orange3'
      } else if $in < 1day {
        'yellow3b'
      } else if $in < 3day {
        'chartreuse2b'
      } else if $in < 1wk {
        'green3b'
      } else if $in < 6wk {
        'darkturquoise'
      } else if $in < 52wk {
        'deepskyblue3b'
      } else { 'dark_gray' }
    }

    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cellpath: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray

    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_custom: purple
    shape_datetime: cyan_bold
    shape_directory: green_underline
    shape_external: blue
    shape_externalarg: purple
    shape_filepath: green_underline
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
  }

  let-env config = {
    ls: {
      use_ls_colors: true
      clickable_links: true
    }
    rm: {
      always_trash: false
    }
    cd: {
      abbreviations: false
    }
    table: {
      mode: rounded
      index_mode: always
      show_empty: true
      trim: {
        methodology: wrapping
        wrapping_try_keep_words: true
        truncating_suffix: "..."
      }
    }

    explore: {
      help_banner: true
      exit_esc: true

      command_bar_text: '#C4C9C6'
      # command_bar: {fg: '#C4C9C6' bg: '#223311' }

      status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6' }
      # status_bar_text: {fg: '#C4C9C6' bg: '#223311' }

      highlight: {bg: 'yellow' fg: 'black' }

      status: {
        # warn: {bg: 'yellow', fg: 'blue'}
        # error: {bg: 'yellow', fg: 'blue'}
        # info: {bg: 'yellow', fg: 'blue'}
      }

      try: {
        # border_color: 'red'
        # highlighted_color: 'blue'

        # reactive: false
      }

      table: {
        split_line: '#404040'

        cursor: true

        line_index: true
        line_shift: true
        line_head_top: true
        line_head_bottom: true

        show_head: true
        show_index: true

        # selected_cell: {fg: 'white', bg: '#777777'}
        # selected_row: {fg: 'yellow', bg: '#C1C2A3'}
        # selected_column: blue

        # padding_column_right: 2
        # padding_column_left: 2

        # padding_index_left: 2
        # padding_index_right: 1
      }

      config: {
        cursor_color: {bg: 'yellow' fg: 'black' }

        # border_color: white
        # list_color: green
      }
    }

    history: {
      max_size: 10000
      sync_on_enter: true
      file_format: "plaintext"
    }
    completions: {
      case_sensitive: false
      quick: true
      partial: true
      algorithm: "prefix"
      external: {
        enable: true
        max_results: 100
        completer: null
      }
    }
    filesize: {
      metric: true
      format: "auto"
    }
    cursor_shape: {
      emacs: line
      vi_insert: line
      vi_normal: block
    }
    color_config: $dark_theme
    use_grid_icons: true
    footer_mode: "25"
    float_precision: 2
    use_ansi_coloring: true
    edit_mode: vi
    shell_integration: true
    show_banner: false
    render_right_prompt_on_last_line: false

    hooks: {
      display_output: {||
        if (term size).columns >= 100 { table -e } else { table }
      }
    }
    menus: [
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: commands_menu
        only_buffer_difference: false
        marker: "# "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.vars
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
    ]
    keybindings: [
      {
        name: completion_menu
        modifier: none
        keycode: tab
        mode: [emacs vi_normal vi_insert]
        event: {
          until: [
            { send: menu name: completion_menu }
            { send: menunext }
          ]
        }
      }
      {
        name: completion_previous
        modifier: shift
        keycode: backtab
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menuprevious }
      }
      {
        name: history_menu
        modifier: control
        keycode: char_r
        mode: emacs
        event: { send: menu name: history_menu }
      }
      {
        name: next_page
        modifier: control
        keycode: char_x
        mode: emacs
        event: { send: menupagenext }
      }
      {
        name: undo_or_previous_page
        modifier: control
        keycode: char_z
        mode: emacs
        event: {
          until: [
            { send: menupageprevious }
            { edit: undo }
          ]
         }
      }
      {
        name: yank
        modifier: control
        keycode: char_y
        mode: emacs
        event: {
          until: [
            {edit: pastecutbufferafter}
          ]
        }
      }
      {
        name: unix-line-discard
        modifier: control
        keycode: char_u
        mode: [emacs, vi_normal, vi_insert]
        event: {
          until: [
            {edit: cutfromlinestart}
          ]
        }
      }
      {
        name: kill-line
        modifier: control
        keycode: char_k
        mode: [emacs, vi_normal, vi_insert]
        event: {
          until: [
            {edit: cuttolineend}
          ]
        }
      }
      # Keybindings used to trigger the user defined menus
      {
        name: commands_menu
        modifier: control
        keycode: char_t
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menu name: commands_menu }
      }
      {
        name: vars_menu
        modifier: alt
        keycode: char_o
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menu name: vars_menu }
      }
      {
        name: commands_with_description
        modifier: control
        keycode: char_s
        mode: [emacs, vi_normal, vi_insert]
        event: { send: menu name: commands_with_description }
      }
    ]
  }
''
