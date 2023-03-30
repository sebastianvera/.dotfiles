return {
	"andymass/vim-matchup",
	event = "VeryLazy",
	setup = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
	end,
}
