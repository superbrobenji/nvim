local gs = require("gitsigns")

gs.setup({
    signs = {
        add = { text = "+" },
        change = { text = "|" },
        delete = { text = "-" },
        topdelete = { text = " ̅" },
        changedelete = { text = "~" },
        untrack = { text = "·" },
    },
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
})

local gitsigns_opts = {
    desc = "Show Gitsigns",
    noremap = true,
    silent = true,
}

vim.api.nvim_set_keymap("n", "<leader>gso", ":Gitsigns<CR>", gitsigns_opts)
