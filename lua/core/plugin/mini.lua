local mini = {}
local mini_settings = require("mini.surround")

mini.load = function()
    mini_settings.config = {
        -- Number of lines within which surrounding is searched
        n_lines = 20,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 500,

        -- Pattern to match function name in 'function call' surrounding
        -- By default it is a string of letters, '_' or '.'
        funname_pattern = '[%w_%.]+',

        -- Mappings. Use `''` (empty string) to disable one.
        mappings = {
            add = '<Leader>sa',           -- Add surrounding
            delete = '<Leader>sd',        -- Delete surrounding
            find = '<Leader>sf',          -- Find surrounding (to the right)
            find_left = '<Leader>sF',     -- Find surrounding (to the left)
            highlight = '<Leader>sh',     -- Highlight surrounding
            replace = '<Leader>sr',       -- Replace surrounding
            update_n_lines = '<Leader>sn' -- Update `n_lines`
        }
    }
    mini_settings.setup{
    }
end

return mini
