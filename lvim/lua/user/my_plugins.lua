local M = {}

M.config = function()
	lvim.plugins = {
		{ "folke/tokyonight.nvim" },
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("user.indent_blankline").setup()
			end,
			event = "BufRead",
		},
		-- {
		-- 	"simrat39/rust-tools.nvim",
		-- 	config = function()
		-- 		require("user.rust_tools").config()
		-- 	end,
		-- 	ft = { "rust", "rs" },
		-- },
		{
			"folke/todo-comments.nvim",
			config = function()
				require("user.todo_comments").config()
			end,
			event = "BufRead",
		},
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("user.colorizer").config()
			end,
			-- event = "BufRead",
		},
	}
end

return M
