---@diagnostic disable: undefined-global
local lint = require('lint')

lint.linters_by_ft = {
    javascript = { 'eslint' },
    typescript = { 'eslint' },
    typescriptreact = { 'eslint' },
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
    callback = function()
        lint.try_lint()
    end,
})
