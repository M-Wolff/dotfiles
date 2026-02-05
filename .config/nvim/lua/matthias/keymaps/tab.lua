vim.keymap.set("i", "<Tab>", function()
    local col = vim.fn.col(".") - 1
    local line = vim.fn.getline(".")
    local before = line:sub(1, col)
    local ls = require("luasnip")

    if before:match("[/~%.%w%-_/]+$") then
        return "<C-x><C-f>"
    else
        return "<Tab>"
    end
end, { expr = true })
