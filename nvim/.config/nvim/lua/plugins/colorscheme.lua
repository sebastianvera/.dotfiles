return {
	-- "bettervim/yugen.nvim",
	-- config = function()
	-- 	local p = require("yugen.palette")
	-- 	require("yugen").setup({
	-- 		highlight_groups = {
	-- 			LspSignatureActiveParameter = { bg = p.color700 },
	-- 		},
	-- 	})
	-- 	vim.cmd.colorscheme("yugen")
	-- end,

	"datsfilipe/vesper.nvim",
	config = function()
		require("vesper").setup({
			transparent = true,
			italics = {
				comments = true,
				keywords = true,
				functions = false,
				strings = false,
				variables = false,
			},
		})

		vim.cmd.colorscheme("vesper")
	end,
}
