local M = builtin_Class.GenPluginConfig:new(nil)

M:set_name("gelguy/wilder.nvim")

local config = function ()
    -- setup the wilder
    vim.cmd([[
    call wilder#setup({'modes': [':']})
    call wilder#set_option('use_python_remote_plugin', 0)

    call wilder#set_option('pipeline', [
          \   wilder#branch(
          \     wilder#cmdline_pipeline({
          \       'fuzzy': 1,
          \       'fuzzy_filter': wilder#lua_fzy_filter(),
          \     }),
          \     wilder#vim_search_pipeline(),
          \   ),
          \ ])

    call wilder#set_option('renderer', wilder#renderer_mux({
          \ ':': wilder#popupmenu_renderer({
          \      'highlighter': wilder#lua_fzy_highlighter(),
          \      'left': [
          \          ' ',
          \          wilder#popupmenu_devicons(),
          \      ],
          \      'right': [
          \         ' ',
          \         wilder#popupmenu_scrollbar(),
          \       ],
          \      'border': 'rounded',
          \     }),
          \ '/': wilder#wildmenu_renderer({
          \      'highlighter': wilder#lua_fzy_highlighter(),
          \     }),
          \ }))
    ]])
end

M:append_fn(config)

return M
