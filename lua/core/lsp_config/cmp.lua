local M = {}

M.name = "hrsh7th/nvim-cmp"

M.load = function()
    -- general snippet setup
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    vim.g.snipMate = {
        snippet_version = 1
    }

    -- luasnip setup
    local luasnip = require 'luasnip'
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()

    -- vsnip setup
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    -- nvim-cmp setup
    local cmp = require 'cmp'
    -- loading friendly-snippets
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
    cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

    local lspkind = require('lspkind')
    cmp.setup {
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                    vsnip = "[VSnip]"
                })
            }),
        },
        snippet = {
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = 'nvim_lsp', keyword_length = 1 },
            { name = 'luasnip', keyword_length = 1 },
            -- { name = 'vsnip', keyword_length = 1 },
            -- { name = 'ultisnips', keyword_length = 1 },
            -- { name = 'snippy', keyword_length = 1 },
            { name = 'buffer', keyword_length = 5 },
            { name = 'nvim_lua', keyword_length = 1 },
            { name = 'path', keyword_length = 1 },
        },
        experimental = {
            native_menu = false,
            ghost_text = true,
        }
    }
end

return M
