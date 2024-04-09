local lsp = require("lsp-zero").preset({})
local cmp = require('cmp')
local luasnip = require('luasnip')
lsp.preset("recommended")
lsp.extend_cmp()
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

local lspkind = require('lspkind')
local cmp_formatting =
{
    format = lspkind.cmp_format({
        max_width = 50,
        symbol_map = { Copilot = "" },
        before = function(entry, vim_item)
            return vim_item
        end
    })
}

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
local lua_ls = function()
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
end

local graphql = function()
    lsp_config.graphql.setup({
        capabilities = capabilities,
        filetypes = {
            "graphql",
            "typescriptreact",
            "javascriptreact",
            "typescript"
        },
    })
end

local bashls = function()
    lsp_config.bashls.setup({
        capabilities = capabilities,
    })
end

local jsonls = function()
    lsp_config.jsonls.setup({
        capabilities = capabilities,
    })
end

local taplo = function()
    lsp_config.taplo.setup({
        capabilities = capabilities,
    })
end

local eslint = function()
    lsp_config.eslint.setup({
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        root_dir = lsp_config.util.root_pattern("package.json", "package-lock.json"),
        filetypes = {
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "javascript",
            "javascriptreact",
            "javascript.jsx"
        },
        single_file_support = true,
    })
end

local tsserver = function()
    lsp_config.tsserver.setup({
        capabilities = capabilities,
    })
end

local yamlls = function()
    lsp_config.yamlls.setup({
        capabilities = capabilities,
    })
end

local dockerls = function()
    lsp_config.dockerls.setup({
        capabilities = capabilities,
    })
end

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
    'graphql',
    'dockerls',
}

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

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
    handlers = {
        lsp.default_setup,
        lua_ls = lua_ls,
        graphql = graphql,
        bashls = bashls,
        jsonls = jsonls,
        taplo = taplo,
        eslint = eslint,
        tsserver = tsserver,
        yamlls = yamlls,
        dockerls = dockerls,
    }
})


lsp.setup()
