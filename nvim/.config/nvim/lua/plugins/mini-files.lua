return {
	"echasnovski/mini.files",
	version = false,
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"-",
			function()
				local minifiles_toggle = function(...)
					if not MiniFiles.close() then
						MiniFiles.open(...)
					end
				end
				minifiles_toggle(vim.api.nvim_buf_get_name(0))
			end,
			mode = { "n" },
			desc = "Toggle File Manager",
			noremap = true,
		},
	},
}
