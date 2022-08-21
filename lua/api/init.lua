local function api_load()
    _G.MESSAGE = "TESTING"

    local core = require("core")

    -- This is a list that contains some useful plugins
    -- for the configs
    _G.api_o_utils = core.utils

    -- contains the functions for the key bindings
    _G.api_o_keymap = core.keymap

    -- constains constans values
    _G.api_o_const = core.constant

    _G.api_o_config = core.config

    -- This function reads the files from plugins folder
    _G.api_f_parser = core.parser

    _G.api_o_colour = core.colour
    _G.dev = core.dev_tools

    -- avoid warning
    _G.vim = vim
end

-- TODO
local function global_cmd_load()
    vim.api.nvim_create_user_command(
        'Reload',
        function()
            print("Reloading")
            local dev_tools = require "core.dev_tools"
            local path = api_o_utils.get_config_path()
            dev_tools.r(path .. "/init.lua")
            print("hello")
        end,
        {}
    )
end

api_load()
-- global_cmd_load()
