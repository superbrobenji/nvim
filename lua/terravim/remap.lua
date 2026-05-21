-- enter vim file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Go to nvim default file explorer

-- toggleterm
vim.keymap.set('n', 't', '<cmd>ToggleTerm<CR>')
vim.keymap.set('t', '<C-t>', '<cmd>ToggleTerm<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<leader>nt', function()
    local terms = require('toggleterm.terminal').get_all(true)
    local max_id = 0
    for _, t in ipairs(terms) do
        if t.id > max_id then max_id = t.id end
    end
    vim.cmd((max_id + 1) .. 'ToggleTerm')
end)

vim.keymap.set('t', '<C-n>', function()
    local terms = require('toggleterm.terminal').get_all(true)
    if #terms <= 1 then return end
    local cur = vim.b.toggle_number
    local idx = 1
    for i, t in ipairs(terms) do
        if t.id == cur then idx = i break end
    end
    local next_idx = (idx % #terms) + 1
    terms[next_idx]:open()
end)

vim.keymap.set('t', '<C-p>', function()
    local terms = require('toggleterm.terminal').get_all(true)
    if #terms <= 1 then return end
    local cur = vim.b.toggle_number
    local idx = 1
    for i, t in ipairs(terms) do
        if t.id == cur then idx = i break end
    end
    local prev_idx = ((idx - 2 + #terms) % #terms) + 1
    terms[prev_idx]:open()
end)

vim.keymap.set('t', '<C-x>', function()
    local terms = require('toggleterm.terminal').get_all(true)
    local cur_id = vim.b.toggle_number
    local prev = nil
    for _, t in ipairs(terms) do
        if t.id ~= cur_id then prev = t end
        if t.id == cur_id then break end
    end
    local cur = require('toggleterm.terminal').get(cur_id)
    if cur then cur:shutdown() end
    if prev then prev:open() end
end)

-- undo tree
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>") -- Open undo tree window

-- window navigation
vim.keymap.set("n", "<leader>nw", "<C-w>v")                     -- Create new window
vim.keymap.set("n", "<C-q>", "<C-w>p")                          -- Jump to previous window
vim.keymap.set("n", "<C-h>", "<C-w>h")                          -- Navigate to left window
vim.keymap.set("n", "<C-l>", "<C-w>l")                          -- Navigate to right windw
vim.keymap.set("n", "<C-j>", "<C-w>j")                          -- Navigate to bottom window
vim.keymap.set("n", "<C-k>", "<C-w>k")                          -- Navigate to top window
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])       -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])       -- make the window smaller vertically
vim.keymap.set("n", "<C-+>", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "<C-_>", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- move blocks of code up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move codeblock down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move codeblock up

--copy entire line
vim.keymap.set("n", "Y", "yg$")
-- keep cursor at beginning of line when joining lines
vim.keymap.set("n", "J", "mzJ`z")
-- keep cursor in center when half page scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep cursor in center when jumping to next match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste from system clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete to black hole register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- stay in normal and add new line
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- allign ctrl c and esc
vim.keymap.set("n", "<C-c>", "<Esc>")

-- don't worry about this
vim.keymap.set("n", "Q", "<nop>")
-- project finder using tmux. Needs tmux and tmux config to work
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/scripts/tmux-sessionizer.sh<CR>")

-- replace word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
