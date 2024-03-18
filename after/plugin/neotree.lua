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
    },
})
vim.keymap.set("n", "<C-n>", ":Neotree reveal position=left toggle<CR>")

