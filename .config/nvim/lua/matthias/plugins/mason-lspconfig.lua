
-- LSP Config: Language Servers (modern API)
return{
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"neovim/nvim-lspconfig"},
    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = {"lua_ls", -- LUA
            "pyright", -- python
            "hls", -- Haskell
            "jdtls", -- Java
            "marksman", -- Markdown
            "texlab", -- LaTeX
        }
    }
end
    }
