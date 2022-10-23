require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "go",
    "html",
    "javascript",
    "markdown",
    "query",
    "rust",
    "tsx",
    "typescript",
    "comment",
    "lua",
    "fish",
  },
  highlight = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true,

      goto_next_start = {
        ["]p"] = "@parameter.inner",
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[p"] = "@parameter.inner",
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },

    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",

        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
  },
})
