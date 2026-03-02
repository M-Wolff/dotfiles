-- Vim-fugitive
return {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
    init = function()
        vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git Status" })
        vim.keymap.set("n", "<leader>gl", "<cmd>Git log -- %<CR>", { desc = "Git Log (file)" })
        vim.keymap.set("n", "<leader>gL", "<cmd>Git log<CR>", { desc = "Git Log (full)" })
    end,
}
