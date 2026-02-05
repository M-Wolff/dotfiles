vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
-- Rename symbol under cursor
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true })
vim.keymap.set("n", "<leader>R", function() require('telescope.builtin').lsp_references({previewer=false,}) end, { silent = true })
