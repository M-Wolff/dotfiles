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

require("lazy").setup({
require("matthias.plugins.autopairs"),
require("matthias.plugins.catppuccin"),
require("matthias.plugins.comment"),
require("matthias.plugins.harpoon"),
require("matthias.plugins.luasnip"),
require("matthias.plugins.mason"),
require("matthias.plugins.mason-lspconfig"),
require("matthias.plugins.markdown-preview"),
require("matthias.plugins.nvim-cmp"),
require("matthias.plugins.oil"),
require("matthias.plugins.surround"),
require("matthias.plugins.tabout"),
require("matthias.plugins.telescope"),
require("matthias.plugins.treesitter"),
require("matthias.plugins.vimtex"),
})


-- ############################### Custom-Commands ################################
require("matthias.commands.TSInfo")  -- :TSInfo for treesitter info (filetype)
require("matthias.commands.SeperatorLine")  -- create Seperator Line
require("matthias.commands.ToggleLineNumbers")  -- toggle line numbers (relative, absolute, off)

-- ################################ Custom-Keymaps ################################
-- this must be loaded as last position after everything else
require("matthias.keymaps/custom")
require("matthias.keymaps/lsp")
require("matthias.keymaps/tab")


