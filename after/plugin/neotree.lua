require("neo-tree").setup({
    window = {
        position = "left",
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
    },
    filesystem = {
        follow_current_file = {
            enabled = true,
            update_root = true,
        },
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
                '.git',
                '.DS_Store',
            },
            never_show = {},
        },
    },
})
vim.keymap.set("n", "<C-n>", ":Neotree reveal position=left toggle<CR>")
