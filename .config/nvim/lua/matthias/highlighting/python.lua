vim.api.nvim_set_hl(0, "TodoComment", {
	bg = "#9d5550",
	fg = "#f0c674",
	bold = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.fn.matchadd("TodoComment", [[#\s*TODO.*]])
	end,
})
