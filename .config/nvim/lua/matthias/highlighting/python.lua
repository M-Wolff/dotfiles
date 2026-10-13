-- Highlight TODO Comments bright red
vim.api.nvim_set_hl(0, "TodoComment", {
	bg = "#9d5550",
	fg = "#f0c674",
	bold = true,
})

-- Define ToDo patterns for python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.fn.matchadd("TodoComment", [[#\s*TODO.*]])
	end,
})
