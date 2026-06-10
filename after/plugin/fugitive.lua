local float_win = nil

local function open_float(buf)
    if float_win and vim.api.nvim_win_is_valid(float_win) then
        vim.api.nvim_win_set_buf(float_win, buf)
        vim.api.nvim_set_current_win(float_win)
    else
        local width = math.floor(vim.o.columns * 0.85)
        local usable_lines = vim.o.lines - vim.o.cmdheight
        local height = math.floor(usable_lines * 0.85)
        float_win = vim.api.nvim_open_win(buf, true, {
            relative = 'editor',
            row = math.floor((usable_lines - height) / 2),
            col = math.floor((vim.o.columns - width) / 2),
            width = width,
            height = height,
            style = 'minimal',
            border = 'rounded',
        })
    end
end

local function openGit()
    vim.cmd.Git()
    local buf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_close(win, false)
    open_float(buf)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "git" },
    callback = function()
        vim.schedule(function()
            local win = vim.api.nvim_get_current_win()
            local cfg = vim.api.nvim_win_get_config(win)
            if cfg.relative == "" then
                local buf = vim.api.nvim_win_get_buf(win)
                vim.api.nvim_win_close(win, false)
                open_float(buf)
            end
        end)
    end,
})
vim.keymap.set("n", "<leader>gs", openGit)
vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
vim.keymap.set("n", "<leader>gg", ":Git pull<CR>")
vim.keymap.set("n", "<leader>grs", ":Git reset --soft HEAD^<CR>")
vim.keymap.set("n", "<leader>gss", ":Git stash<CR>")
vim.keymap.set("n", "<leader>gsp", ":Git stash pop<CR>")
vim.keymap.set("n", "<leader>cb", ":Git checkout -b ")
