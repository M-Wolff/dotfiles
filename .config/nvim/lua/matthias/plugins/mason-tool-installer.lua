-- Linter/Formatter installation
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua", -- LUA
				"ruff", -- Python
				"isort", -- Import sorting
				-- "prettierd", -- JSON, Markdown, ... formatter
			},
		})
	end,
}
