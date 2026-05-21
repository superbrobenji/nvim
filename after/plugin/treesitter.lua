require('nvim-treesitter').setup {
  rainbow = { enabled = true },
  indent = { enable = true },
  autotag = { enable = true },
}
require('nvim-treesitter').install {"http", "json", "javascript", "typescript", "c", "lua", "vim", "query", "rust", "toml", "go", "c_sharp", "bash", "graphql"}

require('treesitter-context').setup({
    multiline_threshold = 4,
})
