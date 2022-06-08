local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.setup({
  -- Do not jump to snippet if i'm outside of it
  -- https://github.com/L3MON4D3/LuaSnip/issues/78
  region_check_events = "CursorMoved",
  delete_check_events = "TextChanged",

  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  store_selection_keys = "<c-s>",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "Constant" } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { "●", "MoreMsg" } },
      },
    },
  },
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
vim.cmd([[ command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files() ]])
