local M = {}

M.load = function()
    require('refactoring').setup({
        -- prompt for return type
        prompt_func_return_type = {go = true, cpp = true, c = true, java = true},
        -- prompt for function parameters
        prompt_func_param_type = {go = true, cpp = true, c = true, java = true}
    })

    -- load refactoring Telescope extension
    require("telescope").load_extension("refactoring")

    -- remap to open the Telescope refactoring menu in visual mode
    vim.api.nvim_set_keymap(
        "v",
        "<leader>rr",
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        { noremap = true }
    )
    -- statement (or set two remaps for either one). This remap must be made in normal mode.
    vim.api.nvim_set_keymap(
        "n",
        "<leader>rp",
        ":lua require('refactoring').debug.printf({below = false})<CR>",
        { noremap = true }
    )
    -- Print var: this remap should be made in visual mode
    vim.api.nvim_set_keymap("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })

    -- Cleanup function: this remap should be made in normal mode
    vim.api.nvim_set_keymap("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })

    -- Remaps for each of the four debug operations currently offered by the plugin
    -- vim.api.nvim_set_keymap("v", "<Leader>re",
    --                         [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    --                         {noremap = true, silent = true, expr = false})
    -- vim.api.nvim_set_keymap("v", "<Leader>rf",
    --                         [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    --                         {noremap = true, silent = true, expr = false})
    -- vim.api.nvim_set_keymap("v", "<Leader>rv",
    --                         [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    --                         {noremap = true, silent = true, expr = false})
    -- vim.api.nvim_set_keymap("v", "<Leader>ri",
    --                         [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    --                         {noremap = true, silent = true, expr = false})
    -- vim.api.nvim_set_keymap("n", "<Leader>ri",
    --                         [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    --                         {noremap = true, silent = true, expr = false})
end

return M
