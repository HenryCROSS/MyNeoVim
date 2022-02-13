local mini = {}
local surround_settings = require("mini.surround")
local cursorword_settings = require("mini.cursorword")

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
end

return mini
