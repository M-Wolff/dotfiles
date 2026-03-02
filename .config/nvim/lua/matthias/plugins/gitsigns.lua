-- Gitsigns
return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = true, -- show blame inline
    },
    init = function()
        local gitsigns = require('gitsigns')
        vim.keymap.set("n", "<leader>gb", gitsigns.blame)
        vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk)
        vim.keymap.set("n", "<leader>gN", gitsigns.prev_hunk)
    end,
}
