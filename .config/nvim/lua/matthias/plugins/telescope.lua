-- Telescope: Fuzzy Finder
return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		require("telescope").setup({
			defaults = {
				-- Ignore these folders when searching
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"__pycache__",
					"%.aux$",
					"%.bbl$",
					"%.blg$",
					"%.fls$",
					"%.fdb_latexmk$",
					"%.out$",
					"%.synctex%.gz$",
					"%.toc$",
					"%.pdf$",
					"%.nav$",
					"%.vrb$",
					"%.snm$",
					"%.png$",
					"%.jpg$",
				},
			},
			extensions = {
				fzf = {},
			},
		})
		telescope.load_extension("fzf")
		-- Keymaps for Telescope
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", function()
			-- no_ignore=true causes .gitignore patterns to NOT be used
			builtin.find_files({ no_ignore = true })
		end, { desc = "Telescope find files" }) -- find files

		vim.keymap.set("n", "<leader>fg", function()
			-- no_ignore=true causes .gitignore patterns to NOT be used
			builtin.live_grep({ no_ignore = true })
		end, { desc = "Telescope live grep" }) -- grep
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" }) -- buffers
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({
				prompt_title = "Neovim Config",
				cwd = vim.fn.stdpath("config"), -- find files in .config/nvim configuration directory
				hidden = true,
			})
		end, { desc = "Find files in nvim config" })
	end,
}
