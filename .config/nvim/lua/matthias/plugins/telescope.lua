-- Telescope: Fuzzy Finder
return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }},
        config = function()
            local telescope = require("telescope")
            require("telescope").setup({
                defaults = {
                    -- Ignore these folders when searching
                    file_ignore_patterns = {"node_modules", ".git/"},
                },
                extensions = {
                    fzf={}
                }
            })
            telescope.load_extension("fzf")
            -- Keymaps for Telescope
            vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- find files
            vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')  -- search text in project
        end,
    }
