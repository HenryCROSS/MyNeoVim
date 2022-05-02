local M = builtin_Class.GenPluginConfig:new(nil)
local autosave_settings = M:require("autosave")

M:set_name("Pocco81/AutoSave.nvim")

local config = function ()
    autosave_settings.setup{
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = true,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
end

M:append_fn(config)

return M
