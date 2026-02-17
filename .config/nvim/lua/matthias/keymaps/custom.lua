-- Optional: basic save/quit shortcuts
vim.keymap.set('n', '<C-s>', ':w<CR>', {silent=true})
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', {silent=true})
-- hide highlighting after search
vim.keymap.set('n', '<C-h>', ':noh<CR>',{silent=true})
-- Ctrl-l toggles line numbers
vim.keymap.set("n", "<C-l>", ":lua ToggleLineNumbers()<CR>")
-- Seperator block
vim.keymap.set("n", "<Leader>l", ":lua SeperatorText()<CR>", { silent = true })
