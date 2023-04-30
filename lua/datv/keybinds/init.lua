--###################################################################################
--       __  ___                      _
--      /  |/  /____ _ ____   ____   (_)____   ____ _ _____
--     / /|_/ // __ `// __ \ / __ \ / // __ \ / __ `// ___/
--    / /  / // /_/ // /_/ // /_/ // // / / // /_/ /(__  )
--   /_/  /_/ \__,_// .___// .___//_//_/ /_/ \__, //____/
--                 /_/    /_/               /____/
--
--###################################################################################

-- Map Leader -- 

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

map('n', '<Space>', '', {})
vim.g.mapleader = '-'
vim.g.maplocalleader = '-'

-- ESC --
map('i', 'jk', '<ESC>', {noremap = true})
map('i', 'kj', '<ESC>', {noremap = true})

-- 
map("n", "r", ':redo <cr>', {noremap = true, silent = false})

-- Find and replace
cmd('nnoremap <A-h> :%s//gc<left><left><left>')

-- Open Tree Files
-- map('n', '<C-o>', ':NvimTreeToggle <CR>', { noremap = true, silent = true})
map('n', '<C-o>', ':NvimTreeToggle <CR>', { noremap = true, silent = true})
map('n', '<C-r>', ':NvimTreeRefresh <CR>', { noremap = true, silent = true})
map('n', '<C-f>', ':NvimTreeFindFile <CR>', { noremap = true, silent = true})

-- ############################################# TAB ########################################################################### -- 
-- Tab space
map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

-- Tab File 
map('n', '<Tab>', ':bnext<CR>', {noremap = true, silent = true})
map('n', '<S-Tab>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move Line
map('n', '<A-j>', ':m .+1<cr>==', { noremap = true, silent = true})
map('n', '<A-k>', ':m .-2<cr>==', { noremap = true, silent = true})

-- Move Size Tab
map('n', '<S-j>', ':resize -2<CR>', {noremap = true, silent = true})
map('n', '<S-k>', ':resize +2<CR>', {noremap = true, silent = true})
map('n', '<S-h>', ':vertical resize -2<CR>', {noremap = true, silent = true})
map('n', '<S-l>', ':vertical resize +2<CR>', {noremap = true, silent = true})

-- Map move tab - di chuyen tab
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})

-- telescope
map('n', '<leader>f', ':Telescope find_files<cr>', {noremap = true, silent = true})
map('n', '<leader>r', ':Telescope live_grep<CR>', {noremap = true, silent = false})
map('n', '<leader>b', ':Telescope buffers<CR>', {noremap = true, silent = false})
map('n', '<leader>h', ':Telescope help_tags<CR>', {noremap = true, silent = false})

map("n", "<leader>g", ':MarkdownPreview github<CR>', {noremap = true, silent = true})
map("n", "<leader>d", ":MarkdownPreview solarized-dark<cr>", {noremap = true, silent = true})
map("n", "<leader>l", ":MarkdownPreview solarized-light<cr>", {noremap = true, silent = true})
