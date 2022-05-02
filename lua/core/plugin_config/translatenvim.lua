local M = builtin_Class.GenPluginConfig:new(nil)

local config = function()
    require("translate").setup({
        default = {command = "translate_shell", output = "floating"},
        preset = {output = {split = {append = true}}}
    })

    vim.cmd[[
    nnoremap ,jf :<C-u>Translate JA -output=floating<CR>
    xnoremap ,jf :Translate JA -output=floating<CR>
    nnoremap ,js :<C-u>Translate JA -output=split<CR>
    xnoremap ,js :Translate JA -output=split<CR>
    nnoremap ,ji :<C-u>Translate JA -output=insert<CR>
    xnoremap ,ji :Translate JA -output=insert<CR>
    nnoremap ,jr :<C-u>Translate JA -output=replace<CR>
    xnoremap ,jr :Translate JA -output=replace<CR>

    nnoremap ,ef :<C-u>Translate EN -output=floating<CR>
    xnoremap ,ef :Translate EN -output=floating<CR>
    nnoremap ,es :<C-u>Translate EN -output=split<CR>
    xnoremap ,es :Translate EN -output=split<CR>
    nnoremap ,ei :<C-u>Translate EN -output=insert<CR>
    xnoremap ,ei :Translate EN -output=insert<CR>
    nnoremap ,er :<C-u>Translate EN -output=replace<CR>
    xnoremap ,er :Translate EN -output=replace<CR>
    ]]
end

M:append_fn(config)

return M
