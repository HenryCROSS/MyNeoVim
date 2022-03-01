local M = {}
local concealer = require("core.plugin_config.neorg.concealer")

M.name = "nvim-neorg/neorg"

M.load = function ()
    require('neorg').setup {
        load = {
            -- ["core.integrations.nvim-cmp"] = {},
            ["core.defaults"] = {},
            -- ["core.gtd.base"] = {},
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp"
                }
            },
            ["core.highlights"] = {},
            ["core.norg.concealer"] = {
                config = concealer
            },
            ["core.norg.journal"] = {},
            ["core.norg.qol.toc"] = {},
            -- ["core.presenter"] = {},
            ["core.keybinds"] = {},
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        work = "~/notes/work",
                        home = "~/notes/home",
                    }
                }
            }
        }
    }
end

return M
