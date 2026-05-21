local ensure_installed = {
    'misspell',
    'shellcheck',
    'bashls',
    'dockerls',
    'ts_ls',
    'eslint',
    'prettier',
    'jsonls',
    'lua_ls',
    'graphql',
    'js-debug-adapter',
}

if vim.fn.executable('go') == 1     then table.insert(ensure_installed, 'gopls') end
if vim.fn.executable('dotnet') == 1 then table.insert(ensure_installed, 'csharp_ls') end
if vim.fn.executable('cargo') == 1  then table.insert(ensure_installed, 'rust_analyzer') end

require('mason-tool-installer').setup({
    ensure_installed = ensure_installed,
    auto_update = true,
    run_on_start = true,
    start_delay = 3000,
    debounce_hours = 5,
})
