vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
-- Rename symbol under cursor
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true })
vim.keymap.set("n", "<leader>R", function() require('telescope.builtin').lsp_references({previewer=false,}) end, { silent = true })
-- Auto show errors on hover (250ms)
vim.o.updatetime = 250  -- milliseconds until CursorHold triggers
-- Define the highlights
vim.cmd([[
  highlight DiagnosticFloatingError guifg=#FFFFFF guibg=#5C1E1E
  highlight DiagnosticFloatingWarn  guifg=#FFFFFF guibg=#5C3E1E
  highlight DiagnosticFloatingInfo  guifg=#FFFFFF guibg=#1E3E5C
  highlight DiagnosticFloatingHint  guifg=#FFFFFF guibg=#1E5C3E
]])
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, {
        focus = false,
        border = "rounded",

    })
  end,
})
