vim.api.nvim_create_user_command("FormatOff", function()
	vim.b.disable_autoformat = true
end, {})

vim.api.nvim_create_user_command("FormatOn", function()
	vim.b.disable_autoformat = nil
end, {})
