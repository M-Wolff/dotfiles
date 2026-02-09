local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
    s("main", {
        t('if __name__ == "__main__":'), t({"", "\t"}),
        i(0, "# code here")
    })
})

