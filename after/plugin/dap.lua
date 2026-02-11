local dap = require "dap"
local ui = require "dapui"

require('dapui').setup()
require('dap-go').setup()
require('netcoredbg-macOS-arm64').setup(dap)

require("nvim-dap-virtual-text").setup()


vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.restart)

vim.keymap.set("n", "<leader>?", function()
    require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<leader>d", function() ui.open() end)
vim.keymap.set("n", "<leader>D", function() ui.close() end)
dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end

dap.adapters.dart = {
    type = "executable",
    -- As of this writing, this functionality is open for review in https://github.com/flutter/flutter/pull/91802
    command = "flutter",
    args = { "debug_adapter" }
}
dap.configurations.dart = {
    {
        type = "dart",
        request = "launch",
        name = "Launch Flutter Program",
        -- The nvim-dap plugin populates this variable with the filename of the current buffer
        program = "${file}",
        -- The nvim-dap plugin populates this variable with the editor's current working directory
        cwd = "${workspaceFolder}",
        -- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
        toolArgs = { "-d", "D65188FC-90E1-48B5-A70C-A6FF1FCE3AAF", "--flavor", "staging", "--target", "lib/main_staging.dart", "--dart-define-from-file=staging_config.json" }

    }
}
