local actions = require("telescope.actions")

require("telescope").setup({
  defaults = require("telescope.themes").get_dropdown({
    winblend = 0,
    mappings = {
      i = {
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

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
})

require('telescope').load_extension('fzf')
