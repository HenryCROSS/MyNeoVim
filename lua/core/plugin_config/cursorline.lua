local cursorline = {}

cursorline.name = "yamatsum/nvim-cursorline"

cursorline.load = function()
    vim.g.cursorline_timeout = 1
end

return cursorline
