-- Snippets Engine: LuaSnip
return{
    "L3MON4D3/LuaSnip",
    dependencies = {
        --"rafamadriz/friendly-snippets",
        "L3MON4D3/jsregexp",
    },
    config = function()
        --require("luasnip.loaders.from_vscode").lazy_load()
        require("matthias.luasnip_snippets.python")
        require("matthias.luasnip_snippets.tex")
    end
}
