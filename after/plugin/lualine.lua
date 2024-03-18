require('lualine').setup({
    options = { theme = 'tokyonight' },
    sections = {
        lualine_x = {
            {
                "harpoon2",
                indicators = { "h", "t", "n", "s" },
                active_indicators = { "[H]", "[T]", "[N]", "[S]" },
                separator = " ",
            },
            'filetype',
        },
    }
})
