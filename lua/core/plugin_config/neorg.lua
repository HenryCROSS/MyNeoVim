local M = {}

M.load = function ()
    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            -- ["core.gtd.base"] = {},
            -- ["core.norg.completion"] = {},
            ["core.norg.concealer"] = {},
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
