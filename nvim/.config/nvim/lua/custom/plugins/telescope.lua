return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = require("telescope.themes").get_dropdown({
				file_ignore_patterns = { ".git/", "node_modules" },
				winblend = 0,
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						-- Change keys to select previous and next
						["<Down>"] = false,
						["<Up>"] = false,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						-- Use <C-a> to move all to qflist
						-- Use <C-q> to move selected to qflist
						["<M-q>"] = false,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
					},
					n = {
						["<M-q>"] = false,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
					},
				},
			}),
			pickers = {
				git_files = {
					show_untracked = true,
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
				find_files = {
					find_command = { "rg", "--files", "--hidden" },
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		}
	end,
}
