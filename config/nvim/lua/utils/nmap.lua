--- Adds two numbers.
--- @param keys string
--- @param func function
--- @param desc string
local nmap = function(keys, func, desc)
    if desc then
        desc = desc
    end
    vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
end

return nmap
