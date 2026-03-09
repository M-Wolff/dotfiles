-- Conform: code formatting
return {
	"stevearc/conform.nvim",

	-- Load plugin before saving files
	event = { "BufWritePre" },

	-- Debug command to check formatter status
	cmd = { "ConformInfo" },

	-- Keybinding to manually format
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n",
			desc = "Format current buffer",
		},
	},

	---@module "conform"
	---@type conform.setupOpts
	opts = {

		-- Which formatter to use for each language
		formatters_by_ft = {

			-- Lua formatting
			lua = { "stylua" },

			-- Python formatting + lint fixing + import sorting
			python = { "ruff_fix", "ruff_format", "isort" },
		},

		-- If no external formatter exists, fallback to LSP
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Automatically format files when saving
		format_on_save = {
			timeout_ms = 5000,
		},
	},
}
