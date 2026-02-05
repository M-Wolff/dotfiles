-- Toggle Line Numbers
function ToggleLineNumbers()
    if vim.wo.number and vim.wo.relativenumber then
        vim.wo.number = false
        vim.wo.relativenumber = false
    elseif vim.wo.number then
        vim.wo.relativenumber = true
    else
        vim.wo.number = true
    end
end
