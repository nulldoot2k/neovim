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
vim.g.mapleader = "-"
local map = vim.api.nvim_set_keymap

-- ESC --
map('i', 'jk', '<ESC>', {noremap = true})
map('i', 'kj', '<ESC>', {noremap = true})

-- 
map("n", "r", ':redo <cr>', {noremap = true, silent = false})

-- Find and replace
-- map('n', 'S-h', ':%s//gc<left><left><left>', { noremap = true })
vim.cmd('nnoremap <A-h> :%s//gc<left><left><left>')

-- Open Tree Files
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

-- ################################################### lspsaga ################################################################# --
-- scroll up hover doc
map("n", "<A-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
    {noremap = true, silent = true})
-- scroll down hover doc or scroll in definition preview
map("n", "<A-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
    {noremap = true, silent = true})
-- lsp provider to find the cursor word definition and reference
map("n", "gh", ":Lspsaga lsp_finder<cr>", {noremap = true, silent = true})
-- lsp action code
map("n", "lca", ":Lspsaga code_action<CR>", {noremap = true, silent = true})
map("v", "lca", ":<C-U>Lspsaga range_code_action<CR>", {noremap = true, silent = true})
-- show hover doc
map("n", "<leader>K", ":Lspsaga hover_doc<CR>", {noremap = true, silent = true})
-- show signature help
map("n", "gs", ":Lspsaga signature_help<CR>", {noremap = true, silent = true})
-- rename 
map("n", "rn", ":Lspsaga rename<CR>", {noremap = true, silent = true})
-- preview definition
map("n", "lpd", ":Lspsaga preview_definition<CR>", {noremap = true, silent = true})
-- jump diagnostic show error
map("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true})
map("n", "e]", ":Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true})

-- ################################################################################################################################# --
-- CommentToggle 
if require'nvim_comment'.enabled then vim.api.nvim_set_keymap('v', '<leader>cl', ':CommentToggle<cr>', {noremap = true, silent = true}) end

vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
vim.cmd("vnoremap // y/\\V<C-R>=escape(@\",'/\')<CR><CR>")

-- Run Code 
-- map("n", "<F5>", ":sp<bar>:w<CR> :term node %<CR> :startinsert<CR>", {noremap = true, silent = true})
-- map("n", "<F5>", ":sp<bar>:w<CR> :term python3 %<CR> :startinsert<CR>", {noremap = true, silent = true})
vim.cmd[[ 
augroup mygroup
    autocmd!
    " execute python code
    autocmd FileType python nnoremap <buffer> <F5>
                \ :sp<bar>:w<CR> :term python3 %<CR> :startinsert<CR>
    " execute javascript code
    autocmd FileType javascript nnoremap <buffer> <F5>
                \ :sp<bar>:w<CR> :term node %<CR> :startinsert<CR>
    autocmd filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++11 % <cr> :vnew <bar> :te "a.exe" <cr><cr>
    autocmd filetype cpp nnoremap <f6> :vnew <bar> :te "a.exe" <cr>
    autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
    autocmd FileType go nnoremap <buffer> <F5>
                \ :sp<bar>:w<cr> :term go run %<cr> :startinsert<cr>
augroup end
]]

-- auto close and open nvim-tree after exists
vim.cmd[[ 
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" solidity 
autocmd BufNewFile,BufRead *.sol setfiletype solidity
]]
-- Markdown preview
map("n", "<C-p>", ":MarkdownPreview <cr>", {noremap = true, silent = true})
map("n", "<C-s>", ":MarkdownPreviewStop <cr>", {noremap = true, silent = true})

