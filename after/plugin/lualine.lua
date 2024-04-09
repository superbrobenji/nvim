require('lualine').setup({
    options = { theme = 'tokyonight' },
    sections = {
        lualine_x = {
            {
                "harpoon2",
                indicators = { "h", "j", "k", "l" },
                active_indicators = { "[H]", "[J]", "[K]", "[L]" },
                separator = " ",
            },
            'filetype',
        },
    }
})
