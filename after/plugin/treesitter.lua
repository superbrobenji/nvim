require('nvim-treesitter').setup()

require('nvim-treesitter').install({
    'http', 'json', 'javascript', 'typescript', 'c', 'lua', 'vim',
    'query', 'rust', 'toml', 'go', 'c_sharp', 'bash', 'graphql',
})

require('nvim-treesitter-context').setup({ multiline_threshold = 4 })

require('nvim-ts-autotag').setup()
