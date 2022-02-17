local mini = {}
local surround_settings = require("mini.surround")
local cursorword_settings = require("mini.cursorword")
local indentscope_settings = require("mini.indentscope")

mini.load = function()
    surround_settings.setup {
        -- Number of lines within which surrounding is searched
        n_lines = 20,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 500,

        -- Pattern to match function name in 'function call' surrounding
        -- By default it is a string of letters, '_' or '.'
        funname_pattern = '[%w_%.]+',

        -- Mappings. Use `''` (empty string) to disable one.
        mappings = {
            add = '<Leader>ma', -- Add surrounding
            delete = '<Leader>md', -- Delete surrounding
            find = '<Leader>mf', -- Find surrounding (to the right)
            find_left = '<Leader>mF', -- Find surrounding (to the left)
            highlight = '<Leader>mh', -- Highlight surrounding
            replace = '<Leader>mr', -- Replace surrounding
            update_n_lines = '<Leader>mn' -- Update `n_lines`
        }
    }
    cursorword_settings.setup {
        delay = 0;
    }
    indentscope_settings.setup{
        {
          draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 1,

            -- Animation rule for scope's first drawing. A function which, given next
            -- and total step numbers, returns wait time (in ms). See
            -- |MiniIndentscope.gen_animation()| for builtin options. To not use
            -- animation, supply `require('mini.indentscope').gen_animation('none')`.
            animation =  indentscope_settings.gen_animation('quarticIn')
          },

          -- Module mappings. Use `''` (empty string) to disable one.
          mappings = {
            -- Textobjects
            object_scope = 'ii',
            object_scope_with_border = 'ai',

            -- Motions (jump to respective border line; if not present - body line)
            goto_top = '[i',
            goto_bottom = ']i',
          },

          -- Options which control computation of scope. Buffer local values can be
          -- supplied in buffer variable `vim.b.miniindentscope_options`.
          options = {
            -- Type of scope's border: which line(s) with smaller indent to
            -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
            border = 'both',

            -- Whether to use cursor column when computing reference indent. Useful to
            -- see incremental scopes with horizontal cursor movements.
            indent_at_cursor = true,

            -- Whether to first check input line to be a border of adjacent scope.
            -- Use it if you want to place cursor on function header to get scope of
            -- its body.
            try_as_border = true,
          },

          -- Which character to use for drawing scope indicator
          -- symbol = '╎',
          symbol = '|',
        }
    }
end

return mini
