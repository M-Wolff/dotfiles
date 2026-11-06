-- Highlighting in Markdown Documents

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.fn.matchadd("TodoComment", [[\c\<TODO.*$]])
		vim.fn.matchadd("DoneComment", [[\c\<DONE.*$]])
	end,
})
