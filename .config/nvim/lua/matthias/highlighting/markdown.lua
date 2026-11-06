-- Highlighting in Markdown Documents

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- \c to make it case-insensitive
		-- \< to force beginning of word and ignore unintentional combinations like masTODOn for highlighting
		vim.fn.matchadd("TodoComment", [[\c\<TODO.*$]])
		vim.fn.matchadd("DoneComment", [[\c\<DONE.*$]])
	end,
})
