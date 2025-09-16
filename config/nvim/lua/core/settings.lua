-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Disable the use of the mouse in all modes
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noinsert,noselect'

-- Makes invisible characters (like tabs and trailing spaces) visible in the editor
vim.opt.list = true

-- relative numbers
vim.opt.relativenumber = false

-- rounded borders for diagnostics and floating windows
vim.opt.winborder = 'rounded'

-- Width of tab character
vim.opt.tabstop = 4

-- Determines the amount of whitespace to add in normal mode
vim.opt.shiftwidth = 4

-- Smart indent
vim.opt.smartindent = true

-- Swap/backup/undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Save undo history
vim.opt.undofile = true

-- Auto-reload changed files
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    callback = function()
        if vim.fn.expand("%") ~= "[Command Line]" then
            vim.cmd("checktime")
        end
    end,
})

-- Notify when a file is changed on disk
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
        vim.api.nvim_echo({ { "File changed on disk. Buffer reloaded.", "WarningMsg" } }, true, {})
    end,
})

-- Wrapping and list chars
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
    extends = "#",
    nbsp = "·",
}

-- Indentation
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.copyindent = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Matching, search, replace
vim.opt.showmatch = true
vim.opt.gdefault = true

-- Backup/undo dirs (adjust as needed)
local tmp = vim.fn.expand("~/.vim/temp//")
vim.opt.backupdir = tmp
vim.opt.directory = tmp
vim.opt.undodir = tmp

-- Command-line completion
vim.opt.wildmode = "longest,list,full"

-- UI
vim.opt.showtabline = 1
vim.opt.cursorline = true
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.belloff = "all"

-- Folding
vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 1
vim.opt.foldnestmax = 10

-- Local config (⚠️ security risk if no 'secure')
vim.opt.exrc = true

-- Cursor style (reset to terminal default)
vim.opt.guicursor = ""

-- Scrolling
vim.opt.scrolloff = 10

-- Statusline handles mode, so don’t show separately
vim.opt.showmode = false
