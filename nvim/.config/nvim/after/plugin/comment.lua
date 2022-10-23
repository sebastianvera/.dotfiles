require('Comment').setup({
    pre_hook = function()
        -- Only calculate commentstring for tsx filetypes
        if vim.bo.filetype == 'typescriptreact' then
          return require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
            -- local U = require('Comment.utils')
            --
            -- -- Determine whether to use linewise or blockwise commentstring
            -- local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'
            --
            -- -- Determine the location where to calculate commentstring from
            -- local location = nil
            -- if ctx.ctype == U.ctype.blockwise then
            --     location = require('ts_context_commentstring.utils').get_cursor_location()
            -- elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            --     location = require('ts_context_commentstring.utils').get_visual_start_location()
            -- end
            --
            -- return require('ts_context_commentstring.internal').calculate_commentstring({
            --     key = type,
            --     location = location,
            -- })
        end
    end,
})

local comment_ft = require "Comment.ft"
comment_ft.set("lua", { "--%s", "--[[%s]]" })
