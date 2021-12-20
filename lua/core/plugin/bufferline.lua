local bufferline = {}
local bufferline_settings = require("bufferline")
local config = {}

bufferline.load = function()
    bufferline_settings.setup {
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                }
            },
            numbers = function(opts)
                return string.format('%s·%s', opts.raise(opts.id),
                                     opts.lower(opts.ordinal))
            end,
            diagnostics = 'nvim_lsp',
            indicator_icon = '▎',
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
			separator_style = "thick",
			enforce_regular_tabs = true,
        }
    }
end

return bufferline
