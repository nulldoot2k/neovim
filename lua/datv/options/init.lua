------------------------------------------------------------------------------------------
--  ____    ______  ______  __  __            ______           _____
-- /\  _`\ /\  _  \/\__  _\/\ \/\ \          /\  _  \         /\  __`\
-- \ \ \/\ \ \ \L\ \/_/\ \/\ \ \ \ \         \ \ \L\ \        \ \ \/\ \  _____     ____
--  \ \ \ \ \ \  __ \ \ \ \ \ \ \ \ \  _______\ \  __ \        \ \ \ \ \/\ '__`\  /',__\
--   \ \ \_\ \ \ \/\ \ \ \ \ \ \ \_/ \/\______\\ \ \/\ \        \ \ \_\ \ \ \L\ \/\__, `\
--    \ \____/\ \_\ \_\ \ \_\ \ `\___/\/______/ \ \_\ \_\        \ \_____\ \ ,__/\/\____/
--     \/___/  \/_/\/_/  \/_/  `\/__/            \/_/\/_/  _______\/_____/\ \ \/  \/___/
--                                                        /\______\        \ \_\
--                                                        \/______/         \/_/
------------------------------------------------------------------------------------------

vim.g.mapleader = "-"
vim.cmd('filetype plugin indent on')
vim.cmd('set nofsync')
vim.cmd('set foldmethod=manual')
vim.g.polyglot_disabled = 'solidity'
vim.cmd('set nocompatible hidden laststatus=2')
vim.cmd[[colorscheme tokyonight]]

vim.cmd[[
set relativenumber
set listchars=tab:▸\ ,trail:·
]]

vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.expandtab = true

vim.bo.expandtab = true
vim.wo.number = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.autoindent = true

-- Disable various builtin plugins in Vim that bog down speed
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1


