local function load()
_G.MESSAGE = "TESTING"

local core = require("core")
--
--
--
--

-- This is a list that contains some useful plugins
-- for the configs
_G.api_o_utils = core.utils

-- contains the functions for the key bindings
_G.api_o_keymap = core.keymap

-- This function reads the files from plugins folder
_G.api_f_parser = core.parser

-- constains constans values
_G.api_o_const = core.constant

_G.api_o_config = core.config

-- avoid warning
_G.vim = vim
end

load()
