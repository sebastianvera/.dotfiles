return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  dependencies = {
    "andymass/vim-matchup",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = {
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
      additional_vim_regex_highlighting = false,
      disable = {},
    },
    matchup = {
      enable = true,
    },
    -- context_commentstring = {
    --   enable = true,
    -- },
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
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    require("nvim-ts-autotag").setup()
  end,
}
