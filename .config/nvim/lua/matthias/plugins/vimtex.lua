-- Vimtex: LaTeX Support
return{ "lervag/vimtex",
init = function()
    -- Set tab width for LaTeX files
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
            vim.bo.shiftwidth = 2   -- number of spaces for autoindent
            vim.bo.tabstop = 2      -- number of spaces a <Tab> counts for
            vim.bo.softtabstop = 2  -- number of spaces inserted when pressing <Tab>
            vim.bo.expandtab = true -- use spaces instead of tabs
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
