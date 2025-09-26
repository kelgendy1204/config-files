--- Adds two numbers.
--- @param keys string
--- @param func function
--- @param desc string|nil
local nmap = function(keys, func, desc)
    desc = desc or nil
    vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
end

return nmap
