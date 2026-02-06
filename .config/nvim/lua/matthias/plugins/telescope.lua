-- Telescope: Fuzzy Finder
return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},},
        config = function()
            local telescope = require("telescope")
            require("telescope").setup({
                defaults = {
                    -- Ignore these folders when searching
                    file_ignore_patterns = {"node_modules", ".git/"},
                },
                extensions = {
                    fzf={}
                },
            })
            telescope.load_extension("fzf")
            -- Keymaps for Telescope
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files,{ desc = "Telescope find files"}) -- find files
            vim.keymap.set('n', '<leader>fg', builtin.live_grep,{ desc = "Telescope live grep"}) -- grep
            vim.keymap.set('n', '<leader>fb', builtin.buffers,{ desc = "Telescope buffers"}) -- buffers
            vim.keymap.set('n', '<leader>fc', function()
                builtin.find_files({
                    prompt_title = "Neovim Config",
                    cwd=vim.fn.stdpath("config"),  -- find files in .config/nvim configuration directory
                    hidden = true,
                })
            end, {desc = "Find files in nvim config"})
        end,
    }
