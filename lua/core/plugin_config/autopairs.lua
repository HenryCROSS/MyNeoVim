local autopairs_settings = {}
local npairs = require('nvim-autopairs')
local ts_conds = require('nvim-autopairs.ts-conds')
local Rule = require('nvim-autopairs.rule')
local remap = vim.api.nvim_set_keymap

function autopairs_settings.load()
    npairs.setup {
        -- map_bs=false, map_cr=false,
        -- 启用treesitter
        check_ts = true,
        enable_check_bracket_line = false,
    }

    -- press % => %% only while inside a comment or string
    npairs.add_rules({
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({
            'string', 'comment'
        })),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({'function'}))
    })

    _G.MUtils = {}

    -- MUtils.CR = function()
    --     if vim.fn.pumvisible() ~= 0 then
    --         if vim.fn.complete_info({'selected'}).selected ~= -1 then
    --             return npairs.esc('<c-y>')
    --         else
    --             return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    --         end
    --     else
    --         return npairs.autopairs_cr()
    --     end
    -- end
    -- remap('i', '<cr>', 'v:lua.MUtils.CR()', {expr = true, noremap = true})
    --
    -- MUtils.BS = function()
    --     if vim.fn.pumvisible() ~= 0 then
    --         if vim.fn.complete_info({'mode'}).mode == 'eval' then
    --             return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    --         end
    --     else
    --         return npairs.autopairs_bs()
    --     end
    -- end
    -- remap('i', '<bs>', 'v:lua.MUtils.BS()', {expr = true, noremap = true})

    -- vim.g.coq_settings = {keymap = {recommended = false}}

    remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]],
          {expr = true, noremap = true})
    remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]],
          {expr = true, noremap = true})
    remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]],
          {expr = true, noremap = true})
    remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]],
          {expr = true, noremap = true})
end

return autopairs_settings
