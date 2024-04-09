-- enter vim file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Go to nvim default file explorer

-- FloaTerm configuration
vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=5 <CR> ") -- Add new terminal instance
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")                                                       -- Toggle terminal window open/close
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")                                                             -- Minimize terminal
vim.keymap.set('t', "<C-p>", "<C-\\><C-n>:FloatermPrev<CR>")                                                  -- Go to previous terminal instance
vim.keymap.set('t', "<C-n>", "<C-\\><C-n>:FloatermNext<CR>")                                                  -- Go to next terminal instance
vim.keymap.set('t', "<C-x>", "<C-\\><C-n>:FloatermKill<CR>")                                                  -- Kill terminal instance

-- undo tree
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>") -- Open undo tree window

-- window navigation
vim.keymap.set("n", "<leader>nw", "<C-w>v")                 -- Create new window
vim.keymap.set("n", "<C-q>", "<C-w>p")                      -- Jump to previous window
vim.keymap.set("n", "<C-h>", "<C-w>h")                      -- Navigate to left window
vim.keymap.set("n", "<C-l>", "<C-w>l")                      -- Navigate to right windw
vim.keymap.set("n", "<C-j>", "<C-w>j")                      -- Navigate to bottom window
vim.keymap.set("n", "<C-k>", "<C-w>k")                      -- Navigate to top window
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

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

-- jest
vim.keymap.set("n", "<leader>tf", function() -- Test whole file
    require('nvim-jest').test_file()
end)
vim.keymap.set("n", "<leader>ts", function() -- Test single test
    require('nvim-jest').test_single()
end)
vim.keymap.set("n", "<leader>js", function() -- Stop tests
    require('nvim-jest').test_stop()
end)

-- replace word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
