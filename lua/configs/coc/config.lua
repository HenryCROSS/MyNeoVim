vim.g.coc_global_extensions = {
    "coc-json",
    "coc-git",
    "coc-clangd",
    "coc-sh",
    "coc-cmake",
    "coc-css",
    "coc-html",
    "coc-tsserver",
    "coc-sumneko-lua",
    "coc-markdownlint",
    "coc-marketplace",
    "coc-pyright",
    "coc-spell-checker",
    "coc-lists",
    "coc-vimlsp",
    "coc-snippets",
    "coc-ultisnips",
    "coc-translator",
    "coc-syntax",
    "coc-omnisharp",
    "coc-java",
    "coc-prettier",
    "coc-gitignore",
    "coc-diagnostic",
    "coc-htmlhint",
    "coc-html-css-support",
    "coc-calc",
    "coc-clang-format-style-options",
    "coc-tabnine",
    "coc-tasks",
    "coc-xml",
    "coc-yaml",
    "coc-leetcode",
    "coc-highlight",
    "coc-neosnippet",
    "coc-rust-analyzer",
    "coc-cl",
    "https://github.com/Rpinski/vscode-shebang-snippets"
}

local keyset = vim.keymap.set

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Symbol renaming.
vim.api.nvim_set_keymap('n', '<Leader>cr', '<Plug>(coc-rename)', { silent = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

-- Formatting selected code.
vim.api.nvim_set_keymap('x', '<leader>cf', '<Plug>(coc-format-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>cf', ':call CocActionAsync("format")<CR>', { silent = true })

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
vim.api.nvim_set_keymap('x', '<leader>cs', '<Plug>(coc-codeaction-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>cs', '<Plug>(coc-codeaction-selected)', { silent = true })


-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('n', '<leader>ca', '<Plug>(coc-codeaction)', { silent = true })
-- Apply AutoFix to problem on the current line.
vim.api.nvim_set_keymap('n', '<leader>cx', '<Plug>(coc-fix-current)', { silent = true })
-- Run the Code Lens action on the current line.
vim.api.nvim_set_keymap('n', '<leader>cl', '<Plug>(coc-codelens-action)', { silent = true })

-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)

-- Remap <C-f> and <C-b> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

-- Coc-snippets
vim.g.coc_snippet_next = '<c-j>'
vim.g.coc_snippet_prev = '<c-k>'


-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics.
keyset("n", "<space>zd", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions.
keyset("n", "<space>ze", ":<C-u>CocList extensions<cr>", opts)
-- Show commands.
keyset("n", "<space>zc", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document.
keyset("n", "<space>zo", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols.
keyset("n", "<space>zs", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item.
keyset("n", "<space>zj", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item.
keyset("n", "<space>zk", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list.
keyset("n", "<space>zp", ":<C-u>CocListResume<cr>", opts)

vim.cmd(
    [[
    " set runtimepath^=.local/share/nvim/site/pack/packer/start/coc.nvim
    " Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

""  function! s:check_back_space() abort
""    let col = col('.') - 1
""    return !col || getline('.')[col - 1]  =~ '\s'
""  endfunction
""
""  " Insert <tab> when previous text is space, refresh completion if not.
""  inoremap <silent><expr> <TAB>
""	\ coc#pum#visible() ? coc#pum#next(1):
""	\ <SID>check_back_space() ? "\<Tab>" :
""	\ coc#refresh()
""  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
""
""function! CheckBackspace() abort
""	let col = col('.') - 1
""	return !col || getline('.')[col - 1]  =~# '\s'
""endfunction
""
""" Use <c-space> to trigger completion.
""if has('nvim')
""  inoremap <silent><expr> <c-space> coc#refresh()
""else
""  inoremap <silent><expr> <c-@> coc#refresh()
""endif
""" Make <CR> auto-select the first completion item and notify coc.nvim to
""" format on enter, <cr> could be remapped by other vim plugin
""" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"""                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
""
""  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
""				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocActionAsync('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>cd  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>ze  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>zc  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>zo  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>zs  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>zj  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>zk  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>zp  :<C-u>CocListResume<CR>
    ]]
)
