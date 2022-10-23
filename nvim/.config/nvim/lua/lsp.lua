local M = {}

--- Generates a config table for lspconfig
--- @param config table: Base config
--- @return table
M.generate_sumneko_config = function(config)
	local lua_settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      completion = {
        callSnippet = "Replace"
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
	}

	require("neodev").setup({
		library = {
			runtime = true,
			types = true,
			plugins = false,
		},
	})

	return vim.tbl_extend("keep", config, { settings = lua_settings })
end

--- Generates a config table for lspconfig
--- @param config table: Base config
--- @return table
M.generate_jsonls_config = function(config)
	local jsonls = {
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
						description = "package.json configuration",
						fileMatch = { "package.json" },
						url = "http://json.schemastore.org/package.json",
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
	}

	return vim.tbl_extend("keep", config, jsonls)
end

return M
