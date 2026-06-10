require('avante').setup({
    input = {
        provider = "snacks",
        provider_opts = {
            title = "Avante Input",
            icon = " ",
            placeholder = "Enter your input...",
        },
    },
    provider = "claude",
    
    providers = {
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-sonnet-4-6",
            timeout = 30000, -- Timeout in milliseconds
            api_key = vim.env.CLAUDE_API_KEY,
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
        },
    },
})
