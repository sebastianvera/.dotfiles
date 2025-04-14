return {
	gopls = {
		gopls = {
			hints = {
				functionTypeParameters = true,
			},
		},
	},
	rust_analyzer = {},
	ts_ls = {},
	clangd = {},
	jsonls = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}
