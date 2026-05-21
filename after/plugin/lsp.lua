vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }
        vim.keymap.set('n', 'gd',           vim.lsp.buf.definition,      opts)
        vim.keymap.set('n', 'K',            vim.lsp.buf.hover,            opts)
        vim.keymap.set('n', '<leader>vws',  vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>vd',   vim.diagnostic.open_float,    opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1,  float = true }) end, opts)
        vim.keymap.set('n', '<leader>vca',  vim.lsp.buf.code_action,      opts)
        vim.keymap.set('n', '<leader>vrr',  vim.lsp.buf.references,       opts)
        vim.keymap.set('n', '<leader>vrn',  vim.lsp.buf.rename,           opts)
        vim.keymap.set('i', '<C-h>',        vim.lsp.buf.signature_help,   opts)
    end
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            format     = { enable = true },
            completion = { callSnippet = 'Replace' },
            diagnostics = { globals = { 'vim' } },
        }
    }
})

vim.lsp.config('graphql', {
    filetypes = { 'graphql', 'typescriptreact', 'javascriptreact', 'typescript' },
})

vim.lsp.config('eslint', {
    flags = { debounce_text_changes = 500 },
    root_dir = function(fname)
        return vim.fs.root(fname, { 'package.json', 'package-lock.json' })
    end,
    filetypes = {
        'typescript', 'typescriptreact', 'typescript.tsx',
        'javascript', 'javascriptreact', 'javascript.jsx',
    },
    single_file_support = true,
})

vim.lsp.config('ts_ls', {})
vim.lsp.config('tailwindcss', {})

if vim.fn.executable('dotnet') == 1 then
    vim.lsp.config('csharp_ls', {})
end

if vim.fn.executable('go') == 1 then
    vim.lsp.config('gopls', {})
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        }
    }
})

local lsp_ensure = {
    'pyright', 'ts_ls', 'bashls', 'eslint', 'jsonls',
    'lua_ls', 'graphql', 'dockerls', 'tailwindcss', 'yamlls', 'taplo',
}
if vim.fn.executable('go') == 1     then table.insert(lsp_ensure, 'gopls') end
if vim.fn.executable('dotnet') == 1 then table.insert(lsp_ensure, 'csharp_ls') end

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = lsp_ensure,
    automatic_enable = true,
})
