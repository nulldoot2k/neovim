-- set varrible
local global = vim.g
local cmd = vim.cmd
local bo = vim.bo
local wo = vim.wo
local o = vim.o

-- Map <leader> = the space key
global.mapleader = ' '
global.maplocalleader = ' '

-- editor options
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.ruler = true
o.title = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.shortmess = o.shortmess .. 'c'
o.hidden = true
o.whichwrap = 'b,s,<,>,[,],h,l'
o.pumheight = 10
o.fileencoding = 'utf-8'
o.cmdheight = 1
o.splitbelow = "splitright"
o.termguicolors = true
o.conceallevel = 0
o.showtabline = 2
o.showmode = false
o.backup = false
o.writebackup = false
o.updatetime = 300
o.timeoutlen = 100
o.clipboard = "unnamedplus"
o.hlsearch = false
o.ignorecase = true
o.scrolloff = 3
o.sidescrolloff = 5
o.mouse = "a"
o.softtabstop = 2

bo.expandtab = true
wo.number = true
wo.wrap = false
wo.signcolumn = "yes"
bo.tabstop = 2
bo.shiftwidth = 2
bo.autoindent = true

-- cd[[colorscheme tokyonight]]

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
