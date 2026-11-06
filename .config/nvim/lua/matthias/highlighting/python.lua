-- Highlighting for Python files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		-- \c to make it case-insensitive
		vim.fn.matchadd("TodoComment", [[\c#\s*TODO.*]])
		vim.fn.matchadd("DoneComment", [[\c#\s*DONE.*]])
	end,
})
