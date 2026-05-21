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
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
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
        "folke/snacks.nvim",
        opts = {
            input = { enabled = true },
        },
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { "L3MON4D3/LuaSnip",                 run = "make install_jsregexp" },
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
    {
        "terrortylor/nvim-comment",
        dependencies = {
            { 'leoluz/nvim-dap-go' },
            { 'mfussenegger/nvim-dap' },
            { 'rcarriga/nvim-dap-ui' },
            { 'theHamsta/nvim-dap-virtual-text' },
            { 'nvim-neotest/nvim-nio' },
            { 'williamboman/mason.nvim' },
        },
    },
    { 'nicholasmata/nvim-dap-cs', dependencies = { 'mfussenegger/nvim-dap' } },
    {
        "Cliffback/netcoredbg-macOS-arm64.nvim",
        dependencies = { "mfussenegger/nvim-dap" }
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        instructions_file = "avante.md",
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        version = false, -- Never set this value to "*"! Never!
        ---@module 'avante'
        ---@type avante.Config
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-mini/mini.pick",           -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua",              -- for file_selector provider fzf
            "folke/snacks.nvim",             -- for input provider snacks
            "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
}
return plugins
