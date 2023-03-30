return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    {
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "mtoohey31/cmp-fish",

    -- Icons
    "nvim-tree/nvim-web-devicons",
    "onsails/lspkind.nvim",
  },
  config = function()
    local lsp = require("lsp-zero").preset({
      name = "minimal",
      manage_nvim_cmp = false,
    })

    lsp.nvim_workspace()

    require("lspconfig").jsonls.setup({
      settings = {
        json = {
          schemas = {
            {
              description = "TypeScript compiler configuration file",
              fileMatch = { "tsconfig.json", "tsconfig.*.json" },
              url = "http://json.schemastore.org/tsconfig",
            },
            {
              description = "Lerna config",
              fileMatch = { "lerna.json" },
              url = "http://json.schemastore.org/lerna",
            },
            {
              description = "Babel configuration",
              fileMatch = { ".babelrc.json", ".babelrc", "babel.config.json" },
              url = "http://json.schemastore.org/lerna",
            },
            {
              description = "ESLint config",
              fileMatch = { ".eslintrc.json", ".eslintrc" },
              url = "http://json.schemastore.org/eslintrc",
            },
            {
              description = "Bucklescript config",
              fileMatch = { "bsconfig.json" },
              url = "https://bucklescript.github.io/bucklescript/docson/build-schema.json",
            },
            {
              description = "Prettier config",
              fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
              url = "http://json.schemastore.org/prettierrc",
            },
            {
              description = "Vercel Now config",
              fileMatch = { "now.json" },
              url = "http://json.schemastore.org/now",
            },
            {
              description = "Stylelint config",
              fileMatch = { ".stylelintrc", ".stylelintrc.json", "stylelint.config.json" },
              url = "http://json.schemastore.org/stylelintrc",
            },
          },
        },
      },
    })

    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
    -- Fix Undefined global 'vim'
    -- lsp.configure("lua_ls", {
    --   settings = {
    --     Lua = {
    --       diagnostics = {
    --         globals = { "vim" },
    --       },
    --     },
    --   },
    -- })

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-Space>"] = cmp.mapping.complete(),
    })

    -- disable completion with tab
    -- this helps with copilot setup
    -- cmp_mappings["<Tab>"] = nil
    -- cmp_mappings["<S-Tab>"] = nil

    cmp.setup({
      mapping = cmp_mappings,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          before = require("tailwindcss-colorizer-cmp").formatter,
        }),
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
    })

    lsp.set_preferences({
      suggest_lsp_servers = false,
      -- sign_icons = {
      --     error = 'E',
      --     warn = 'W',
      --     hint = 'H',
      --     info = 'I'
      -- }
    })

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      -- if client.name == "eslint" then
      --     vim.cmd.LspStop('eslint')
      --     return
      -- end

      local ERROR = vim.diagnostic.severity["ERROR"]
      local WARN = vim.diagnostic.severity["WARN"]

      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "[e", function()
        vim.diagnostic.goto_prev({ severity = ERROR })
      end, opts)
      vim.keymap.set("n", "]e", function()
        vim.diagnostic.goto_next({ severity = ERROR })
      end, opts)
      vim.keymap.set("n", "[w", function()
        vim.diagnostic.goto_prev({ severity = WARN })
      end, opts)
      vim.keymap.set("n", "]w", function()
        vim.diagnostic.goto_next({ severity = WARN })
      end, opts)
      vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>vf", vim.lsp.buf.format, opts)
    end)

    require("fidget").setup({
      text = {
        spinner = "moon",
      },
      window = {
        blend = 0,
      },
      sources = {
        ["null-ls"] = { ignore = true },
      },
    })

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
}
