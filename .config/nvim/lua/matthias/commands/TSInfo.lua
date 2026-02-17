-- TSInfo Command
vim.api.nvim_create_user_command("TSInfo", function()
    local bufnr = 0
    local ft = vim.bo[bufnr].filetype

    local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
    local parser_name = ok and parser:lang() or "none"

    print("Filetype: " .. ft .. " | Treesitter parser: " .. parser_name)
end, { desc = "Show current filetype and Treesitter parser" })
