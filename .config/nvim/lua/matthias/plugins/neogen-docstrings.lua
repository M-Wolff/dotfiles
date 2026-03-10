return {
	"danymat/neogen",
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	version = "*",
	config = function()
		require("neogen").setup({})
		vim.keymap.set("n", "<leader>d", ":lua require('neogen').generate({replace=true})<CR>")
	end,
}
