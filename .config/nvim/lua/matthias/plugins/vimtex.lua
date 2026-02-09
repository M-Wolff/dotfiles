-- Vimtex: LaTeX Support
return{ "lervag/vimtex",
init = function()
    -- Set tab width for LaTeX files
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
            vim.opt_local.indentexpr = ""  -- fix indents too deep
            vim.opt_local.shiftwidth = 2   -- number of spaces for autoindent
            vim.opt_local.tabstop = 2      -- number of spaces a <Tab> counts for
            vim.opt_local.softtabstop = 2  -- number of spaces inserted when pressing <Tab>
            vim.opt_local.expandtab = true -- use spaces instead of tabs
        end,
    })
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
        options = {
            "-lualatex",
            "-shell-escape",
            "-interaction=nonstopmode",
            "-synctex=1",
        }
    }
end
}
