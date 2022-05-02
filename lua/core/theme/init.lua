local M = builtin_Class.GenPluginConfig:new(nil)

M:set_name("rebelot/kanagawa.nvim")

local config = function ()
    -- Example config in Lua
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    -- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
    -- vim.cmd [[colorscheme tokyonight]]
    vim.api.nvim_command("colorscheme tokyonight")
end

M:append_fn(config)

return M
