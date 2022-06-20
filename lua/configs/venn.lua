-- local venn_notify = {
--     open_venn_notify = function()
--         ---@diagnostic disable-next-line: missing-parameter
--         vim.notify.dismiss()
--         M.notify = vim.notify("Venn enabled", "info", {
--             title = "Venn",
--             keep = function()
--                 return vim.b.venn_enabled
--             end,
--             render = "minimal",
--         })
--     end,

--     close_venn_notify = function()
--         vim.notify("Venn disabled", "info", {
--             title = "Venn",
--             render = "minimal",
--             replace = M.notify,
--         })
--     end
-- }

local PROPERTY = api_o_const.PROPERTY
return {
    {
        type = PROPERTY.PLUGIN_CONFIG,
        name = "jbyuki/venn.nvim",
        requires = "kevinhwang91/promise-async",
        config = function()

            -- venn.nvim: enable or disable keymappings
            function _G.Toggle_venn()
                local venn_enabled = vim.inspect(vim.b.venn_enabled)
                if venn_enabled == "nil" then
                    vim.b.venn_enabled = true
                    vim.cmd [[setlocal ve=all]]
                    -- draw a line on HJKL keystokes
                    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
                    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
                    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
                    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
                    -- draw a box by pressing "f" with visual selection
                    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
                else
                    vim.cmd [[setlocal ve=]]
                    vim.cmd [[mapclear <buffer>]]
                    vim.b.venn_enabled = nil
                end
            end

            -- toggle keymappings for venn using <leader>v
            api_o_keymap.set('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true })
        end

    },
}
