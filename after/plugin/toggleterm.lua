require('toggleterm').setup({
    direction = 'float',
    float_opts = {
        border = 'rounded',
        width = function() return math.floor(vim.o.columns * 0.85) end,
        height = function() return math.floor(vim.o.lines * 0.85) end,
    },
    persist_mode = true,
    start_in_insert = true,
    shell = vim.o.shell,
})
