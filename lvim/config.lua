-- NOTE: general settings here!
-- deactivate mouse
vim.opt.mouse = ""
-- format on save
lvim.format_on_save = true
-- linting live
lvim.lint_on_save = false
-- colorschemes
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"
-- lvim.colorscheme = "spacegray"
vim.opt.timeoutlen = 200
lvim.leader = "space"
-- have spell check on all the time
-- lvim.default_settings.spell = true

-- keys - weird bug with ESC - jk keys
-- lvim.keys.normal_mode["<A-Up>"] = nil
-- lvim.keys.normal_mode["<A-Down>"] = nil
lvim.keys.insert_mode["<A-k>"] = nil
lvim.keys.insert_mode["<A-j>"] = nil
lvim.keys.normal_mode["<A-j>"] = nil
lvim.keys.normal_mode["<A-k>"] = nil

-- NOTE: settings for core plugins here!
-- git signs settings
-- lvim.builtin.gitsigns.active = false
-- dashboard settings
lvim.builtin.alpha.active = true
lvim.builtin.alpha.footer = { "" }
lvim.builtin.alpha.custom_header = { "" }
-- terminal settings
lvim.builtin.terminal.active = true
-- nvimtree settings
lvim.builtin.nvimtree.hide_dotfiles = false
lvim.builtin.nvimtree.show_icons.git = false
lvim.builtin.nvimtree.ignore = { ".git", ".idea", ".vscode" }
-- barbar settings
lvim.builtin.bufferline.active = true
-- auto-pairs
-- lvim.builtin.auto-pairs.add_rules = ("<", ">", "lua")
-- telescope settings
lvim.builtin.telescope.defaults.path_display = {}
lvim.builtin.telescope.defaults.find_command = { "rg" }
-- treesitter settings
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell", "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
-- LSP settings
lvim.lsp.diagnostics.virtual_text = false
-- indent backline settings
vim.opt.listchars = {
	space = "⋅",
	eol = "↴",
}

-- lualine settings
-- lvim.builtin.lualine.options.component_separators = { "||" }
-- require("user.lualine_evil").config()
-- require("user.lualine").config()

-- NOTE: EXTRAS
-- plugins
require("user.my_plugins").config()
-- autocommands
require("user.my_autocommands").config()
-- keybindings
-- require("user.keybindings").config()
lvim.lsp.automatic_servers_installation = true
-- FORMATTERS
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black", filetypes = { "python" } },
	{ exe = "stylua", filetypes = { "lua" } },
})
-- LINTERS
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ exe = "flake8", filetypes = { "python" } },
})
