return {
	"echasnovski/mini.files",
	version = false,
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"-",
			":lua MiniFiles.open()<CR>",
			mode = { "n" },
			desc = "Toggle File Manager",
			noremap = true,
		},
	},
}
