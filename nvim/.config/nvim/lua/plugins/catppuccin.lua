return {
	"catppuccin/nvim",
	name = "catpuccin",
	lazy = false,
	priority = 1000,
	opts = {
		transparent_background = true,
		flavour = "mocha",
	},
	config = function(_, opts)
		-- vim.g.catpuccin_flavour = "macchiato"
		-- vim.cmd [[ colorscheme monotono ]]
		require("catppuccin").setup(opts)
		vim.api.nvim_command [[ colorscheme catppuccin ]]
	end,
}
