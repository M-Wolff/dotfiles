-- Completion Engine: nvim-cmp
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		-- Pattern used for word recognition for auto completion suggestions
		-- especially to make Umlauts work and hyphenated words like "Äpfel-Größe"
		local word_pattern = [[\k\+\%(-\k\+\)*]]
		cmp.setup({
			-- make Umlauts work
			completion = {
				keyword_pattern = word_pattern,
			},
			-- Configure snippet expansion
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			-- Key mappings for completion menu
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
						return
					elseif luasnip.jumpable(1) then
						luasnip.jump(1)
						return
					else
						fallback()
					end
				end, { "i", "s" }),
				--["<Tab>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
				["<Down>"] = cmp.mapping.select_next_item(),
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				-- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
			}),
			-- Sources for completion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP completions
				{ name = "luasnip" }, -- Snippet completions
				-- make Umlauts work for buffer completion using keyword_pattern
				{ name = "buffer", option = { keyword_pattern = word_pattern } }, -- Buffer completions
				{ name = "path" }, -- Directory Path completions
			}),
		})
	end,
}
