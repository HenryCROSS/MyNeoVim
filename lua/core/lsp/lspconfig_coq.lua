local lspconfig = {}
local lspconfig_settings = require('lspconfig')


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<Leader>ck',
    '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leader><tab>a',
    '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader><tab>r',
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader><tab>l',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    opts)
    buf_set_keymap('n', '<Leader>cD',
    '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>',
    opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<Leader>cq', '<cmd>lua vim.diagnostic.setloclist()<CR>',
    --                opts)
    buf_set_keymap('n', '<Leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>',
    opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = require("core.lsp.lsp_servers")
-- local servers = {'pyright', 'rust_analyzer', 'tsserver', 'sourcekit'}

lspconfig.load = function()
    vim.g.coq_settings = {
        auto_start = true,
        keymap = {jump_to_mark = '<c-g>', },
        clients = {
            tabnine = {enabled = false},
            lsp = { resolve_timeout = 30000 },
        },
        match = { max_results = 5 }
        -- limits = {completion_auto_timeout = 3000}
        -- display = {pum={fast_close = false}}
    }


    local coq = require "coq" -- using coq
    require("coq_3p")
    {
        { src = "nvimlua", short_name = "nLUA", conf_only = true },
        -- { src = "bc", short_name = "MATH", precision = 6 },
    }


    for _, lsp in ipairs(servers) do
        lspconfig_settings[lsp].setup {
            flags = {debounce_text_changes = 150},
            on_attach = on_attach,
            coq.lsp_ensure_capabilities({
                -- flags = {debounce_text_changes = 150},
                -- on_attach = on_attach,
            })
        }
    end

    -- lspconfig_settings.sourcekit.setup {
    --     coq.lsp_ensure_capabilities {
    --         cmd = {"sourcekit-lsp"},
    --         filetypes = {"swift", "c", "cpp", "objective-c", "objective-cpp"},
    --         -- root_dir = root_pattern("Package.swift", ".git")
    --     }
    -- }
end

return lspconfig
