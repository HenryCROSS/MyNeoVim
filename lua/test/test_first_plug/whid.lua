local api = vim.api
local buf, wim

local function open_window()
    buf = api.nvim_create_buf(false, true) -- create new empty buffer

    api.nvim_buf_set_options(buf, 'bufhidden', 'wipe')

    -- get dimensions
    local width = api.nvim_get_option("colums")
end
