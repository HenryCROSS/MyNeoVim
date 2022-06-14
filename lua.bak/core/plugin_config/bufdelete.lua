local M = builtin_Class.GenPluginConfig:new(nil)

local config = function ()
    vim.api.nvim_set_keymap("n", "<Leader>bk", "<cmd>Bdelete<CR>", {noremap = true})
end

M:set_name("famiu/bufdelete.nvim")
M:append_fn(config)

return M
