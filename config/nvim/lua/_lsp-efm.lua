local lspconfig = require('lspconfig')

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintIgnoreExitCode = true,
}

-- Prettier configuration
local prettier = {
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
}

lspconfig.efm.setup({
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    settings = {
        rootMarkers = { ".git/", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yml" },
        languages = {
            javascript = { eslint, prettier },
            javascriptreact = { eslint, prettier },
            ["javascript.jsx"] = { eslint, prettier },
            typescript = { eslint, prettier },
            typescriptreact = { eslint, prettier },
            ["typescript.tsx"] = { eslint, prettier },
            markdown = { prettier },
        }
    }
})
