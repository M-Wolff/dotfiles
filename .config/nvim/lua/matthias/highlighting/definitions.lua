-- Type and color definitions for highlighting
-- TODO: Muted red
vim.api.nvim_set_hl(0, "TodoComment", {
	bg = "#9d5550",
	fg = "#f0c674",
	bold = true,
})

-- DONE: Muted green
vim.api.nvim_set_hl(0, "DoneComment", {
	bg = "#4e7658",
	fg = "#c5dfb5",
	bold = true,
})
