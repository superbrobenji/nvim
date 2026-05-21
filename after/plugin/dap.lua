local dap = require('dap')
local ui  = require('dapui')

require('dapui').setup()
require('nvim-dap-virtual-text').setup()

-- Go DAP
if vim.fn.executable('go') == 1 then
    require('dap-go').setup()
end

-- .NET DAP
if vim.fn.executable('dotnet') == 1 then
    require('netcoredbg-macOS-arm64').setup(dap)
end

-- Flutter/Dart DAP
if vim.fn.executable('flutter') == 1 then
    dap.adapters.dart = {
        type    = 'executable',
        command = 'flutter',
        args    = { 'debug_adapter' },
    }
    dap.configurations.dart = {
        {
            type      = 'dart',
            request   = 'launch',
            name      = 'Launch Flutter Program',
            program   = '${file}',
            cwd       = '${workspaceFolder}',
            toolArgs  = {
                '-d', 'D65188FC-90E1-48B5-A70C-A6FF1FCE3AAF',
                '--flavor', 'staging',
                '--target', 'lib/main_staging.dart',
                '--dart-define-from-file=staging_config.json',
            },
        }
    }
end

-- JS/TS adapter via mason js-debug-adapter
local js_debug = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'
for _, adapter in ipairs({ 'pwa-node', 'pwa-chrome' }) do
    dap.adapters[adapter] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
            command = 'node',
            args    = { js_debug, '${port}' },
        },
    }
end

local function pick_npm_script()
    local pkg_file = vim.fn.findfile('package.json', vim.fn.getcwd() .. ';')
    if pkg_file == '' then return { vim.fn.input('npm script: ') } end
    local ok, pkg = pcall(vim.fn.json_decode, table.concat(vim.fn.readfile(pkg_file), '\n'))
    if not ok or not pkg.scripts then return { vim.fn.input('npm script: ') } end
    local scripts = vim.tbl_keys(pkg.scripts)
    table.sort(scripts)
    local items = { 'Select npm script:' }
    for i, s in ipairs(scripts) do
        table.insert(items, i .. '. ' .. s .. '  (' .. pkg.scripts[s] .. ')')
    end
    local choice = vim.fn.inputlist(items)
    return { 'run', choice > 0 and scripts[choice] or vim.fn.input('npm script: ') }
end

local js_configs = {
    {
        type    = 'pwa-node',
        request = 'launch',
        name    = 'Launch file',
        program = '${file}',
        cwd     = '${workspaceFolder}',
    },
    {
        type              = 'pwa-node',
        request           = 'launch',
        name              = 'Launch npm script',
        runtimeExecutable = 'npm',
        runtimeArgs       = pick_npm_script,
        cwd               = '${workspaceFolder}',
    },
    {
        type      = 'pwa-node',
        request   = 'attach',
        name      = 'Attach to process',
        processId = require('dap.utils').pick_process,
        cwd       = '${workspaceFolder}',
    },
    {
        type    = 'pwa-chrome',
        request = 'launch',
        name    = 'Launch Chrome / React',
        url     = function()
            local port = vim.fn.input('Port [3000]: ')
            return 'http://localhost:' .. (port ~= '' and port or '3000')
        end,
        webRoot = '${workspaceFolder}/src',
    },
}

for _, ft in ipairs({ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }) do
    dap.configurations[ft] = js_configs
end

-- Auto open/close dapui
dap.listeners.before.attach.dapui_config           = function() ui.open() end
dap.listeners.before.launch.dapui_config           = function() ui.open() end
dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
dap.listeners.before.event_exited.dapui_config     = function() ui.close() end

-- mason-nvim-dap
local dap_ensure = { 'js' }
if vim.fn.executable('go') == 1      then table.insert(dap_ensure, 'delve') end
if vim.fn.executable('dotnet') == 1  then table.insert(dap_ensure, 'coreclr') end
if vim.fn.executable('flutter') == 1 then table.insert(dap_ensure, 'dart') end

require('mason-nvim-dap').setup({
    ensure_installed      = dap_ensure,
    automatic_installation = true,
})

-- Keymaps (leader>d conflict fixed: du/dq/de)
vim.keymap.set('n', '<leader>b',  dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>gb', dap.run_to_cursor)
vim.keymap.set('n', '<leader>du', function() ui.open() end)
vim.keymap.set('n', '<leader>dq', function() ui.close() end)
vim.keymap.set('n', '<leader>de', function() ui.eval(nil, { enter = true }) end)
vim.keymap.set('n', '<F1>', dap.continue)
vim.keymap.set('n', '<F2>', dap.step_into)
vim.keymap.set('n', '<F3>', dap.step_over)
vim.keymap.set('n', '<F4>', dap.step_out)
vim.keymap.set('n', '<F5>', dap.restart)
