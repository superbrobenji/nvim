local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
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
            terminal = {
                enabled = true,
                win = { style = 'terminal' },
            },
        },
    },
    -- LSP stack (mason-org renames + native lspconfig)
    { 'mason-org/mason.nvim' },
    { 'mason-org/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {},
    },
    -- blink.cmp replaces nvim-cmp + LuaSnip + copilot-cmp
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'giuxtaposition/blink-cmp-copilot',
            'folke/lazydev.nvim',
        },
        opts = {
            keymap = {
                ['<C-n>']     = { 'select_next', 'fallback' },
                ['<C-p>']     = { 'select_prev', 'fallback' },
                ['<C-y>']     = { 'accept' },
                ['<C-Space>'] = { 'show' },
            },
            appearance = { nerd_font_variant = 'mono' },
            completion = {
                documentation = { auto_show = true },
                menu = {
                    draw = {
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    return require('lspkind').symbolic(ctx.kind, { mode = 'symbol' })
                                end,
                            },
                        },
                    },
                },
            },
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    },
                    copilot = {
                        name = 'copilot',
                        module = 'blink-cmp-copilot',
                        score_offset = 100,
                        async = true,
                    },
                },
            },
            cmdline = { enabled = true },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
        },
        opts_extend = { 'sources.default' },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
    },
    -- Comment.nvim replaces nvim-comment
    { 'numToStr/Comment.nvim' },
    { "lukas-reineke/indent-blankline.nvim", lazy = false, main = "ibl", opts = {} },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
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
    -- DAP stack (top-level, conditional cond guards)
    { 'mfussenegger/nvim-dap' },
    { 'rcarriga/nvim-dap-ui',             dependencies = { 'nvim-neotest/nvim-nio' } },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'jay-babu/mason-nvim-dap.nvim' },
    { 'leoluz/nvim-dap-go',               cond = function() return vim.fn.executable('go') == 1 end },
    { 'nicholasmata/nvim-dap-cs',         cond = function() return vim.fn.executable('dotnet') == 1 end },
    {
        'Cliffback/netcoredbg-macOS-arm64.nvim',
        cond = function() return vim.fn.executable('dotnet') == 1 end,
        dependencies = { 'mfussenegger/nvim-dap' },
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        instructions_file = "avante.md",
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        version = false,
        ---@module 'avante'
        ---@type avante.Config
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-mini/mini.pick",
            "nvim-telescope/telescope.nvim",
            "ibhagwan/fzf-lua",
            "folke/snacks.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
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
