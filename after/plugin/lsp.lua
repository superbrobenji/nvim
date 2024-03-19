local lsp = require("lsp-zero").preset({})
local cmp = require('cmp')
local luasnip = require('luasnip')
lsp.preset("recommended")

-- autocompletion
local cmp_snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end,
}

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()
})

local cmp_sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'copilot', group_index = 2 },
})

local cmp_formatting = lsp.cmp_format({
    mode = "symbol",
    max_width = 50,
    symbol_map = { Copilot = "" },
    before = function(entry, vim_item)
        return vim_item
    end
})

cmp.setup({
    snipet = cmp_snippet,
    sources = cmp_sources,
    mapping = cmp_mappings,
    formatting = cmp_formatting
})
require("luasnip.loaders.from_vscode").lazy_load()

-- language servers
require('neodev').setup({})

local lsp_config = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- language server handlers
lsp_config.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            format = {
                enable = true,
            },
            completion = {
                callSnippet = "Replace"
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp_config.graphql.setup({
    capabilities = capabilities,
})

lsp_config.bashls.setup({
    capabilities = capabilities,
})

lsp_config.jsonls.setup({
    capabilities = capabilities,
})

lsp_config.taplo.setup({
    capabilities = capabilities,
})

lsp_config.eslint.setup({
    capabilities = capabilities,
    root_dir = lsp_config.util.root_pattern("package.json", "package-lock.json"),
    filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "javascript",
        "javascriptreact",
        "javascript.jsx"
    },
    single_file_support = true
})

lsp_config.tsserver.setup({
    capabilities = capabilities,
})

lsp_config.yamlls.setup({
    capabilities = capabilities,
})

lsp_config.dockerls.setup({
    capabilities = capabilities,
})

local check_eslint_config = function(client)
    if client.name ~= "eslint" and client.name ~= "tsserver" then
        return false
    end
    return true
end

local ensure_installed = {
    'tsserver',
    'bashls',
    'eslint',
    'jsonls',
    'lua_ls',
    'rust_analyzer',
    'graphql',
    'dockerls',
}


lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if check_eslint_config(client) then
        vim.keymap.set("n", "<leader>F", ":EslintFixAll<CR>", opts)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = ":EslintFixAll",
        })
    else
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "lua vim.lsp.buf.format()"
        })
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = ensure_installed,
})


lsp.setup()
