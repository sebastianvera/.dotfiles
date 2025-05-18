return {
  "vague2k/vague.nvim",
  config = function()
    require("vague").setup({
      transparent = true,
    })
    vim.cmd.colorscheme("vague")
  end
	-- "bettervim/yugen.nvim",
	-- config = function()
	-- 	local p = require("yugen.palette")
	-- 	require("yugen").setup({
	-- 		highlight_groups = {
	-- 			LspSignatureActiveParameter = { bg = p.color700 },
	-- 		},
	-- 	})
	-- 	vim.cmd.colorscheme("yugen")
	-- end,

	-- "datsfilipe/vesper.nvim",
	-- config = function()
	-- 	local vesper = require("vesper")
	-- 	local transparent = true
	-- 	local colors = require("vesper.colors")
	-- 	local conf = {
	-- 		transparent = transparent,
	-- 		italics = {
	-- 			comments = true,
	-- 			keywords = true,
	-- 			functions = false,
	-- 			strings = false,
	-- 			variables = false,
	-- 		},
	-- 	}
	--
	-- 	if transparent then
	-- 		conf.palette_overrides = {
	-- 			bgFloat = "NONE",
	-- 			bgOption = "#161616",
	-- 			visual = "#161616",
	-- 		}
	-- 	end
	-- 	conf.overrides = {
	-- 		-- Cursor = { bg = colors.green, fg = colors.bg },
	-- 		PmenuThumb = { bg = colors.bg },
	-- 	}
	--
	-- 	vesper.setup(conf)
	-- 	vesper.colorscheme()
	-- end,
}
