
local M = {}

local function toPacker(src)
    return {
        src.name,
        disable = src.disable, -- Mark a plugin as inactive
        name = src.as, -- Specifies an alias under which to install the plugin
        installer = src.installer, -- Specifies custom installer. See "custom installers" below.
        updater = src.update, -- Specifies custom updater. See "custom installers" below.
        after = src.after, -- Specifies plugins to load before this plugin. See "sequencing" below
        rtp = src.rtp, -- Specifies a subdirectory of the plugin to add to runtimepath.
        lazy = src.opt, -- Manually marks a plugin as optional.
        branch = src.branch, -- Specifies a git branch to use
        tag = src.tag, -- Specifies a git tag to use. Supports '*' for "latest tag"
        commit = src.commit, -- Specifies a git commit to use
        lock = src.lock, -- Skip updating this plugin in updates/syncs. Still cleans.
        build = src.run, -- Post-update/install hook. See "update/install hooks".
        requires = src.requires, -- Specifies plugin dependencies. See "dependencies".
        rocks = src.rocks, -- Specifies Luarocks dependencies for the plugin
        config = src.config, -- Specifies code to run after this plugin is loaded.
        -- The setup key implies opt = true
        setup = src.setup, -- Specifies code to run before this plugin is loaded.
        -- The following keys all imply lazy-loading and imply opt = true
        cmd = src.cmd, -- Specifies commands which load this plugin. Can be an autocmd pattern.
        ft = src.ft, -- Specifies filetypes which load this plugin.
        keys = src.keys, -- Specifies maps which load this plugin. See "Keybindings".
        event = src.event, -- Specifies autocommand events which load this plugin.
        fn = src.fn, -- Specifies functions which load this plugin.
        cond = src.cond, -- Specifies a conditional test to load this plugin
        module = src.module, -- Specifies Lua module names for require. When requiring a string which starts
        -- with one of these module names, the plugin will be loaded.
        module_pattern = src.module_pattern
    }
end

local function toLazy(src)
    return {
        src.name,
        enable = not src.disable, -- Mark a plugin as inactive
        as = src.as, -- Specifies an alias under which to install the plugin
        installer = src.installer, -- Specifies custom installer. See "custom installers" below.
        updater = src.update, -- Specifies custom updater. See "custom installers" below.
        -- no needed
        -- after = src.after, -- Specifies plugins to load before this plugin. See "sequencing" below
        rtp = src.rtp, -- Specifies a subdirectory of the plugin to add to runtimepath.
        opt = src.opt, -- Manually marks a plugin as optional.
        branch = src.branch, -- Specifies a git branch to use
        version = src.tag, -- Specifies a git tag to use. Supports '*' for "latest tag"
        commit = src.commit, -- Specifies a git commit to use
        pin = src.lock, -- Skip updating this plugin in updates/syncs. Still cleans.
        run = src.run, -- Post-update/install hook. See "update/install hooks".
        dependencies = src.requires, -- Specifies plugin dependencies. See "dependencies".
        rocks = src.rocks, -- Specifies Luarocks dependencies for the plugin
        config = src.config, -- Specifies code to run after this plugin is loaded.
        -- The setup key implies opt = true
        init = src.setup, -- Specifies code to run before this plugin is loaded.
        -- The following keys all imply lazy-loading and imply opt = true
        cmd = src.cmd, -- Specifies commands which load this plugin. Can be an autocmd pattern.
        ft = src.ft, -- Specifies filetypes which load this plugin.
        keys = src.keys, -- Specifies maps which load this plugin. See "Keybindings".
        event = src.event, -- Specifies autocommand events which load this plugin.
        fn = src.fn, -- Specifies functions which load this plugin.
        cond = src.cond, -- Specifies a conditional test to load this plugin
        module = src.module, -- Specifies Lua module names for require. When requiring a string which starts
        -- with one of these module names, the plugin will be loaded.
        module_pattern = src.module_pattern
    }
end

local plugin_manager_schema = {
    packer = toPacker,
    lazy = toLazy
}

M.convert_list_to_specific = function(plugin_manager_name, src)
    return plugin_manager_schema[plugin_manager_name](src)
end


local function Packer_to_load(plugin_list)
    local packer_load, packer = pcall(require, "packer")
    if not packer_load then print("Error Packer.nvim is not installed!!!"); return; end
    local name = ""
    local status_ok, _ = xpcall(function()
        packer.startup(function(use)
            for _, plugin in pairs(plugin_list) do
                -- avoid the unexisting plugin
                name = plugin[1]
                if not (api_o_utils.string_is_empty(name)) then
                    use(plugin)
                end
            end
        end)
    end, debug.traceback)

    if not status_ok then print("ERROR Plugin Configs: " .. name) end
end

local function Lazy_to_load(plugin_list)
    local lazy_load, lazy = pcall(require, "lazy")
    if not lazy_load then print("Error Lazy.nvim is not installed!!!"); return; end

    local plugin_lz = vim.tbl_values(plugin_list)
    lazy.setup(plugin_lz, {})
end

local plugin_manager_load = {
    packer = Packer_to_load,
    lazy = Lazy_to_load
}

M.load_plugin_list_with_specific = function(plugin_manager_name, src)
    return plugin_manager_load[plugin_manager_name](src)
end

return M
