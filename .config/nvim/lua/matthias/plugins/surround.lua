-- TODO make sure () dont produce unneccessary spaces
return{
    "nvim-mini/mini.surround",
    branch="stable",
    config = function()
        require("mini.surround").setup({
            ["("] = { add = { "(", ")" }, delete = { "(", ")" } },
            [")"] = false, -- optional: disable if needed
            ["{"] = { add = { "{", "}" }, delete = { "{", "}" } },
            ["}"] = false,
            ["["] = { add = { "[", "]" }, delete = { "[", "]" } },
            ["]"] = false,
        })
    end,
}
