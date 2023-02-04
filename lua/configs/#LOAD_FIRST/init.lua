local PROPERTY = api_o_const.PROPERTY

return {
    unpack(require("configs.#LOAD_FIRST.nvim_config")),
    {
        type = PROPERTY.PLUGIN_MANAGER,
        name = "packer",
        fn = function()
            local ensure_packer = function()
                local fn = vim.fn
                local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
                if fn.empty(fn.glob(install_path)) > 0 then
                    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
                    vim.cmd [[packadd packer.nvim]]
                    return true
                end
                return false
            end

            ensure_packer()

            local args = require("configs.#LOAD_FIRST.packer_configs")
            local ok, packer = pcall(require, "packer")
            if ok then
                packer.init(args)
            end
        end,
    },
    -- {
    --     type = PROPERTY.PLUGIN_CONFIG,
    --     name = "wbthomason/packer.nvim",
    -- },
    {
        type = PROPERTY.PLUGIN_MANAGER,
        name = "lazy",
        fn = function()
            local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
            if not vim.loop.fs_stat(lazypath) then
                vim.fn.system({
                    "git",
                    "clone",
                    "--filter=blob:none",
                    "https://github.com/folke/lazy.nvim.git",
                    "--branch=stable", -- latest stable release
                    lazypath,
                })
            end
            vim.opt.rtp:prepend(lazypath)

            -- local ok, lazy = pcall(require, "lazy")
            -- if ok then
            --     lazy.setup({}, {})
            -- end
        end,
        -- args = configs.packer_config
    },
    {
        type = PROPERTY.LOAD_FUNC,
        fn = function()
            local ok, obj = pcall(require, "impatient")
            if ok then
                obj.enable_profile()
            end
        end
    },
    {
        type = PROPERTY.LOAD_FUNC,
        fn = function()
            -- have to load first for rest of keymap
            vim.g.mapleader = ' '
        end
    },
}
