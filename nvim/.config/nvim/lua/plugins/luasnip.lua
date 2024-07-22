return {
  "L3MON4D3/LuaSnip",
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  build = "make install_jsregexp",
  opts = {
    -- Do not jump to snippet if i'm outside of it
    -- https://github.com/L3MON4D3/LuaSnip/issues/78
    region_check_events = "CursorMoved",
    delete_check_events = "TextChanged",
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    store_selection_keys = "<c-s>",
  },
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function(_, opts)
    require("luasnip").setup(opts)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
    vim.cmd([[ command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files() ]])
  end,
}
