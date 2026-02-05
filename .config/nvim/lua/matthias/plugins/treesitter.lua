
-- Treesitter: Syntax Highlighting & Structural Editing
return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",         -- ensures parsers get updated
    lazy = false,
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "haskell", "java", "markdown", "latex"},
    },
    config = function(_, opts)
        -- install parsers from custom opts.ensure_installed
        if opts.ensure_installed and #opts.ensure_installed > 0 then
            require("nvim-treesitter").install(opts.ensure_installed)
            require("nvim-treesitter.parsers")
            -- register and start parsers for filetypes
            for _, parser in ipairs(opts.ensure_installed) do
                local filetypes = parser -- In this case, parser is the filetype/language name
                vim.treesitter.language.register(parser, filetypes)
                vim.api.nvim_create_autocmd({ "FileType" }, {
                    pattern = filetypes,
                    callback = function(event)
                        vim.treesitter.start(event.buf, parser)
                    end,
                })
            end
        end
    end,
}
