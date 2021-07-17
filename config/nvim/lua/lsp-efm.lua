-- local eslint = {
    -- lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    -- lintIgnoreExitCode = true,
    -- lintStdin = true
-- }
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
  formatStdin = true
}
local util = require "lspconfig".util

require "lspconfig".efm.setup {
    --cmd = {"efm-langserver",},
    init_options = {documentFormatting = true},
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    root_dir = function(fname)
        return util.root_pattern("tsconfig.json")(fname) or
            util.root_pattern(".eslintrc.js", ".git")(fname);
    end,
    settings = {
        rootMarkers = {".eslintrc.js", ".git/"},
        languages = {
            javascript = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},
            typescriptreact = {eslint},
            ["typescript.tsx"] = {eslint}
        }
    }
}
