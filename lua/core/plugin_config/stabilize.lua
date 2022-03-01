local stabilize = {}
local stabilize_settings = require('stabilize')

stabilize.name = "luukvbaal/stabilize.nvim"

stabilize.load = function()
    stabilize_settings.setup {
        force = true, -- stabilize window even when current cursor position will be hidden behind new window
        forcemark = nil, -- set context mark to register on force event which can be jumped to with '<forcemark>
        ignore = { -- do not manage windows matching these file/buftypes
            filetype = {"help", "list", "Trouble"},
            buftype = {"terminal", "quickfix", "loclist"}
        },
        -- nested = "QuickFixCmdPost,DiagnosticChanged *" -- comma-separated list of autocmds that wil trigger the plugins window restore function
        nested = nil -- comma-separated list of autocmds that wil trigger the plugins window restore function
    }
end

return stabilize
