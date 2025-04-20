return {
	"saghen/blink.cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"b0o/schemastore.nvim",
		"moyiz/blink-emoji.nvim",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					-- require("luasnip.loaders.from_vscode").lazy_load({
					-- 	paths = { vim.fn.stdpath("config") .. "/snippets" },
					-- })
					require("luasnip.loaders.from_lua").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets" },
					})

					local extends = {
						typescript = { "tsdoc" },
						javascript = { "jsdoc" },
						typescriptreact = { "typescript" },
						javascriptreact = { "javascript" },
						lua = { "luadoc" },
						python = { "pydoc" },
						rust = { "rustdoc" },
						cs = { "csharpdoc" },
						java = { "javadoc" },
						c = { "cdoc" },
						cpp = { "cppdoc" },
						php = { "phpdoc" },
						kotlin = { "kdoc" },
						ruby = { "rdoc" },
						sh = { "shelldoc" },
					}
					-- friendly-snippets - enable standardized comments snippets
					for ft, snips in pairs(extends) do
						require("luasnip").filetype_extend(ft, snips)
					end
				end,
				keys = {
					{
						"<leader>sp",
						function()
							require("luasnip.loaders").edit_snippet_files({
								-- filter out non custom snippet files
								format = function(file)
									if not string.find(file, ".config/nvim/snippets") then
										return
									end

									return file
								end,
								extend = function(ft, paths)
									-- Create new snippet file for current ft
									if #paths == 0 then
										local config_path = vim.fn.stdpath("config") .. "/snippets/"
										return {
											{ "$CONFIG/" .. ft .. ".lua", config_path .. ft .. ".lua" },
										}
									end

									return {}
								end,
							})
						end,
					},
				},
			},
			opts = { history = true, delete_check_events = "TextChanged" },
		},
	},

	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = false, show_with_menu = false },
			list = { selection = { preselect = false, auto_insert = true } },
			-- menu = { auto_show = false },
		},

		snippets = { preset = "luasnip" },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "emoji" },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
					should_show_items = function()
						return not vim.tbl_contains({ "lua" }, vim.o.filetype)
						-- return vim.tbl_contains(
						-- -- Enable emoji completion only for git commits and markdown.
						-- -- By default, enabled for all file-types.
						--   { "gitcommit", "markdown" },
						--   vim.o.filetype
						-- )
					end,
				},
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },

		-- Experimental signature help support
		signature = {
			enabled = true,
			-- I may want to set this to false
			window = { show_documentation = true },
		},
	},
	opts_extend = { "sources.default" },
}
