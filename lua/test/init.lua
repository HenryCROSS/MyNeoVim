local tests = {}

function whid()
    vim.cmd([[
        if exists('g:loaded_whid') | finish | endif " prevent loading file twice

        let s:save_cpo = &cpo " save user coptions
        set cpo&vim " reset them to defaults

        " command to run our plugin
        command! Whid lua require'test/test_first_plug/whid'.whid()

        let &cpo = s:save_cpo " and restore after
        hi def link WhidHeader      Number
        hi def link WhidSubHeader   Identifier
        unlet s:save_cpo

        let g:loaded_whid = 1
    ]])
end

tests.load = function ()
    whid()

end

return tests
