local lspconfig = {}
local lspconfig_settings = require('lspconfig')

vim.g.coq_settings = {
    auto_start = true,
    keymap = {jump_to_mark = '<c-g>'},
    clients = {tabnine = {enabled = true}}
}

local coq = require "coq" -- using coq

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
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<Leader>k',
                   '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<space>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>',
                   opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = require("core.lsp.lsp_servers")
-- local servers = {'pyright', 'rust_analyzer', 'tsserver', 'sourcekit'}

lspconfig.load = function()
    for _, lsp in ipairs(servers) do
        lspconfig_settings[lsp].setup {
            flags = {debounce_text_changes = 150},
            on_attach = on_attach,
            coq.lsp_ensure_capabilities({})
        }
    end

    require("coq_3p")
    {
        { src = "nvimlua", short_name = "nLUA", conf_only = true },
        { src = "bc", short_name = "MATH", precision = 6 },
    }
    -- lspconfig_settings.sourcekit.setup {
    --     coq.lsp_ensure_capabilities {
    --         cmd = {"sourcekit-lsp"},
    --         filetypes = {"swift", "c", "cpp", "objective-c", "objective-cpp"},
    --         -- root_dir = root_pattern("Package.swift", ".git")
    --     }
    -- }
end

return lspconfig