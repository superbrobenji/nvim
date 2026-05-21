local function openGit()
    vim.cmd.Git()
    local buf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_close(win, false)
    local width = math.floor(vim.o.columns * 0.85)
    local usable_lines = vim.o.lines - vim.o.cmdheight
    local height = math.floor(usable_lines * 0.85)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        row = math.floor((usable_lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        width = width,
        height = height,
        style = 'minimal',
        border = 'rounded',
    })
end
vim.keymap.set("n", "<leader>gs", openGit)
vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
vim.keymap.set("n", "<leader>gg", ":Git pull<CR>")
vim.keymap.set("n", "<leader>grs", ":Git reset --soft HEAD^<CR>")
vim.keymap.set("n", "<leader>gss", ":Git stash<CR>")
vim.keymap.set("n", "<leader>gsp", ":Git stash pop<CR>")
vim.keymap.set("n", "<leader>cb", ":Git checkout -b ")
