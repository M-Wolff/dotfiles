-- Colorscheme: Catppuccin
return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			custom_highlights = function(c)
				-- style for active search highlightings (current search)
				local search_highlight = {
					fg = c.base,
					bg = c.yellow,
					bold = true,
				}
				-- style for normal search highlightings (other occurances)
				local search_normal = {
					fg = c.base,
					bg = "#9e9784",
				}

				return {
					Search = search_normal,
					Substitute = search_normal,
					IncSearch = search_highlight,
					CurSearch = search_highlight,
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
