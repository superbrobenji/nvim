require('nvim-treesitter.configs').setup({
    -- A list of parser names
    ensure_installed = { "http", "json", "javascript", "typescript", "c", "lua", "vim", "query", "rust", "toml", "go", "c_sharp", "bash", "graphql" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    rainbow = { enabled = true },
    indent = { enable = true },
    autotag = { enable = true },
})

require('treesitter-context').setup({
    multiline_threshold = 4,
})
