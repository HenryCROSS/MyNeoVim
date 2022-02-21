local M = {}

M.load = function ()
    vim.cmd([[
    """ Configuration example
    " Echo translation in the cmdline
    nmap <silent> <Leader>tw <Plug>Translate
    vmap <silent> <Leader>tw <Plug>TranslateV
    " Display translation in a window
    nmap <silent> <Leader>tt <Plug>TranslateW
    vmap <silent> <Leader>tt <Plug>TranslateWV
    " Replace the text with translation
    nmap <silent> <Leader>tr <Plug>TranslateR
    vmap <silent> <Leader>tr <Plug>TranslateRV
    " Translate the text in clipboard
    nmap <silent> <Leader>tx <Plug>TranslateX
    ]])
end

return M
