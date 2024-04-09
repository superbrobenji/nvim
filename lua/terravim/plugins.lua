local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
    },
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { 'onsails/lspkind.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { "folke/neodev.nvim",                opts = {} },
        }
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
    },
    { "zbirenbaum/copilot-cmp" },
    { "lukas-reineke/indent-blankline.nvim", lazy = false, main = "ibl", opts = {} },
    { "HiPhish/rainbow-delimiters.nvim" },
    lazy = false,
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "voldikss/vim-floaterm" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "letieu/harpoon-lualine",
        dependencies = {
            {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
            }
        },
    },
    { "lewis6991/gitsigns.nvim" },
    {
        'stevearc/conform.nvim',
        opts = {},
    },

}
return plugins
