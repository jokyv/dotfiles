local M = {}

M.config = function()
	-- Autocommands
	lvim.autocommands.custom_groups = {
		-- rust
		{
			"Filetype",
			"rust",
			"nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('cargo build;read')<CR>",
		},
		{ "Filetype", "rust", "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('cargo run;read')<CR>" },
		{
			"Filetype",
			"rust",
			"nnoremap <leader>T <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='cargo test -- --ignored;read', hidden =false}:toggle()<CR>",
		},
		{
			"Filetype",
			"rust",
			"nnoremap <leader>H <cmd>lua require('core.terminal')._exec_toggle('cargo clippy;read')<CR>",
		},
		{ "Filetype", "rust", "nnoremap <leader>lm <Cmd>RustExpandMacro<CR>" },
		{ "Filetype", "rust", "nnoremap <leader>lH <Cmd>RustToggleInlayHints<CR>" },
		{ "Filetype", "rust", "nnoremap <leader>le <Cmd>RustRunnables<CR>" },
		{ "Filetype", "rust", "nnoremap <leader>lh <Cmd>RustHoverActions<CR>" },

		-- python
		{
			"Filetype",
			"python",
			"nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('python "
				.. vim.fn.expand("%")
				.. ";read')<CR>",
		},
		{
			"Filetype",
			"python",
			"nnoremap <leader>T <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='python -m unittest;read', hidden =false}:toggle()<CR>",
		},
	}
end

return M
