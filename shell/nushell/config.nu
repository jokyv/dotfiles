# Core configuration
$env.config = {
    show_banner: false    
    # shell_integration: true
    # highlight_resolved_commands: true
    table: {
        mode: rounded    
        index_mode: always
        show_empty: true
        padding: { left: 1, right: 1 }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
        }
    }
    error_style: "fancy"
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "prefix"
    }
    history: {
        max_size: 100_000
        sync_on_enter: true
        file_format: "plaintext"
        isolation: false
    }
    filesize: {
        metric: true
        format: "auto"
    }
    # use_grid_icons: true
    footer_mode: 25
    float_precision: 2
    use_ansi_coloring: true
    edit_mode: vi
}

# let-env prompt = create_left_prompt

# Environment variables
$env.EDITOR = "nvim"
$env.PATH = ($env.PATH | split row (char esep) | append "~/dot/bin" | append "~/dot/bin/scripts/")

# Keybindings
$env.config.keybindings = [
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
]

# Source custom configurations
source ~/.config/nushell/aliases.nu     # Load aliases
source ~/.config/nushell/functions.nu   # Load custom functions
source ~/.config/nushell/env.nu         # load custom env

