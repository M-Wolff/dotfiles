vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.autoindent = true
vim.bo.smartindent = false

vim.bo.indentexpr = "v:lua.PseudoIndent(v:lnum)"

function _G.PseudoIndent(lnum)
	local sw = vim.bo.shiftwidth
	local current = vim.fn.getline(lnum)

	local brace_depth = 0

	-- Alle Zeilen vor der aktuellen betrachten
	for i = 1, lnum - 1 do
		local line = vim.fn.getline(i)

		-- Kommentare ignorieren
		local code = line:gsub("//.*$", "")

		local _, opens = code:gsub("{", "")
		local _, closes = code:gsub("}", "")

		brace_depth = brace_depth + opens - closes
	end

	-- Die schließende } selbst gehört eine Ebene weiter nach links
	if current:match("^%s*}") then
		brace_depth = brace_depth - 1
	end

	return math.max(brace_depth * sw, 0)
end
