-- ==========================
-- INIT.LUA for Neovim
-- ==========================
--
-- ==========================
-- Basic Editor Settings
-- ==========================
-- Show absolute line numbers
vim.opt.number = true
-- Show relative line numbers (useful for motions like 5j, 3k)
vim.opt.relativenumber = true
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Number of spaces for each indentation level
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> counts for
vim.opt.tabstop = 4
-- Smart auto-indenting when starting a new line
vim.opt.smartindent = true
vim.opt.autoindent = true
-- Use the system clipboard for yanking/pasting
vim.opt.clipboard = "unnamedplus"
-- Enable 24-bit RGB colors in terminal
vim.opt.termguicolors = true
-- Highlight the line where the cursor is
vim.opt.cursorline = true
-- Do not wrap long lines
vim.opt.wrap = false
-- Set the leader key (used for custom shortcuts)
vim.g.mapleader = " "

-- ==========================
-- Plugin Manager: lazy.nvim
-- ==========================
-- Bootstrap lazy.nvim if it is not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ==========================
-- Plugins
-- ==========================
require("lazy").setup({

    -- ==========================
    -- Colorscheme: Catppuccin
    -- ==========================
    { "catppuccin/nvim", name = "catppuccin" },

    -- ==========================
    -- Treesitter: Syntax Highlighting & Structural Editing
    -- ==========================
    {
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
    },
    -- ==========================
    -- Telescope: Fuzzy Finder
    -- ==========================
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }},
            config = function()
                require("telescope").setup{
                    defaults = {
                        -- Ignore these folders when searching
                        file_ignore_patterns = {"node_modules", ".git/"},
                    },
                    extensions = {
                        fzf={}
                    }
                }
                -- Keymaps for Telescope
                vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- find files
                vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')  -- search text in project
            end
        },
        -- ==========================
        -- Masin
        -- ==========================
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end

        },
        -- ==========================
        -- LSP Config: Language Servers (modern API)
        -- ==========================
        {
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
    },
    -- ==========================
    -- Completion Engine: nvim-cmp
    -- ==========================
    { 
        "hrsh7th/nvim-cmp",
        dependencies = {"hrsh7th/cmp-nvim-lsp","L3MON4D3/LuaSnip","saadparwaiz1/cmp_luasnip"},
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                -- Configure snippet expansion
                snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
                -- Key mappings for completion menu
		mapping = cmp.mapping.preset.insert({
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				elseif luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			--["<Tab>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
                }),
                -- Sources for completion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP completions
                    { name = "luasnip" },  -- Snippet completions
                }),
            })
        end
    },

    -- ==========================
    -- Snippets Engine: LuaSnip
    -- ==========================
    { "L3MON4D3/LuaSnip", dependencies = {"rafamadriz/friendly-snippets"} },

    -- ==========================
    -- Vimtex: LaTeX Support
    -- ==========================
    { "lervag/vimtex" },
    -- ==========================
    -- Oil (Directory / File Editor as Buffer)
    -- ==========================
    { "stevearc/oil.nvim",
    config = function()
        require("oil").setup {
            default_file_explorer = false,
            columns = {
                "icon",
                 --"permissions",
                 --"size",
                 --"mtime",
            },
            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = true,
            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = false,
            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            -- (:help prompt_save_on_select_new_entry)
            prompt_save_on_select_new_entry = true,
            -- Oil will automatically delete hidden buffers after this delay
            -- You can set the delay to false to disable cleanup entirely
            -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
            cleanup_delay_ms = 2000,
            lsp_file_methods = {
                -- Enable or disable LSP file operations
                enabled = true,
                -- Time to wait for LSP file operations to complete before skipping
                timeout_ms = 1000,
                -- Set to true to autosave buffers that are updated with LSP willRenameFiles
                -- Set to "unmodified" to only save unmodified buffers
                autosave_changes = false,
            },
            -- Constrain the cursor to the editable parts of the oil buffer
            -- Set to `false` to disable, or "name" to keep it on the file names
            constrain_cursor = "editable",
            -- Set to true to watch the filesystem for changes and reload oil
            watch_for_changes = false,
            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                ["<CR>"] = "actions.select",
                ["<C-p>"] = "actions.preview",
                ["-"] = { "actions.parent", mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["g."] = { "actions.toggle_hidden", mode = "n" },
                ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = true,
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
                -- This function defines what is considered a "hidden" file
                is_hidden_file = function(name, bufnr)
                    local m = name:match("^%.")
                    return m ~= nil
                end,
                -- This function defines what will never be shown, even when `show_hidden` is set
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                -- Sort file names with numbers in a more intuitive order for humans.
                -- Can be "fast", true, or false. "fast" will turn it off for large directories.
                natural_order = "true",
                -- Sort file and directory names case insensitive
                case_insensitive = false,
                sort = {
                    -- sort order can be "asc" or "desc"
                    -- see :help oil-columns to see which columns are sortable
                    { "type", "asc" },
                    { "name", "asc" },
                },
                -- Customize the highlight group for the file name
                highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                    return nil
                end,
            },
        }
        vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", {desc="Start oil in parent directory"})
    end,
},

-- ==========================
-- Markdown Preview
-- ==========================
{ "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = "markdown" },

})
require("nvim-treesitter.parsers")

-- ==========================
-- Colorscheme Activation
-- ==========================
vim.cmd.colorscheme("catppuccin")

-- ==========================
-- Additional Keymaps
-- ==========================

-- Spectre: live search/replace
-- vim.keymap.set('n', '<leader>sr', '<cmd>lua require("spectre").open()<CR>')

-- Optional: basic save/quit shortcuts
vim.keymap.set('n', '<C-s>', ':w<CR>', {silent=true})
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', {silent=true})
-- hide highlighting after search
vim.keymap.set('n', '<C-h>', ':noh<CR>',{silent=true})
-- Ctrl-l toggles line numbers
vim.keymap.set("n", "<C-l>", ":lua ToggleLineNumbers()<CR>")
-- Seperator block
vim.keymap.set("n", "<Leader>l", ":lua SeperatorText()<CR>", { silent = true })
-- Language server goto definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
-- Rename symbol under cursor
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true })
vim.keymap.set("n", "<leader>R", function() require('telescope.builtin').lsp_references({previewer=false,}) end, { silent = true })
vim.keymap.set("i", "<Tab>", function()
    local col = vim.fn.col(".") - 1
    local line = vim.fn.getline(".")
    local before = line:sub(1, col)
    local ls = require("luasnip")

    if before:match("[/~%.%w%-_/]+$") then
        return "<C-x><C-f>"
    else
        return "<Tab>"
    end
end, { expr = true })
-- ############################### Custom Functions ###############################
-- Seperator Block
function SeperatorText()
    local input = vim.fn.input("Geben Sie den Text ein: ")
    local line_len = 80
    local new_line = ""
    if input == "" then
        new_line = string.rep("#", line_len)
    else
        local pad = math.floor((line_len - #input - 2) / 2)
        new_line = string.rep("#", pad) .. " " .. input .. " " .. string.rep("#", pad)
        if #new_line < line_len then
            new_line = new_line .. "#"
        end
    end
    vim.api.nvim_set_current_line(new_line)
end
-- Toggle Line Numbers
function ToggleLineNumbers()
    if vim.wo.number and vim.wo.relativenumber then
        vim.wo.number = false
        vim.wo.relativenumber = false
    elseif vim.wo.number then
        vim.wo.relativenumber = true
    else
        vim.wo.number = true
    end
end
-- TSInfo Command
vim.api.nvim_create_user_command("TSInfo", function()
    local bufnr = 0
    local ft = vim.bo[bufnr].filetype

    local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
    local parser_name = ok and parser:lang() or "none"

    print("Filetype: " .. ft .. " | Treesitter parser: " .. parser_name)
end, { desc = "Show current filetype and Treesitter parser" })

--########################### Filetype-specific stuff ############################
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
  },
}
