local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, {noremap = true}, { silent = true })
end
local cmd = vim.cmd

-- <leader> = the space key

-- Save
map("n", "<leader>w", "<CMD>update<CR>")
map("n", "<leader>s", "<CMD>so%<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')

-- redo and undo
map("n", "r", '<CMD>redo <cr>')
map("n", "u", '<CMD>undo <cr>')

-- Find and replace
map('n', '<A-h>', ':%s//gc<left><left><left>')

-- Tab space
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Tab File 
map('n', '<Tab>', '<CMD>bnext<CR>')
map('n', '<S-Tab>', '<CMD>bprevious<CR>')

-- Move Line
map('n', '<A-j>', '<CMD>m .+1<cr>==')
map('n', '<A-k>', '<CMD>m .-2<cr>==')

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Map move tab 
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Windows
map("n", "<leader>n", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- taskbar
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>')
