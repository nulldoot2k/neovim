local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end

  -- color
  use { 'folke/tokyonight.nvim'}

  -- comment --
  use {"terrortylor/nvim-comment", config = "require('comment-config')"}

  -- tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = require('nvim-tree-config')
  }
  

  -- searching
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    cmd = "Telescope",
    config = "require('telescope-config')"
  }


  -- markdown preview
  use {
    'davidgranstrom/nvim-markdown-preview'
  }

  -- mason lsp
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- config = require('mason-config'),
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    "tami5/lspsaga.nvim",
    "onsails/lspkind-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    --config = require('lsp-config'),
  }

  -- console
  use {"akinsho/toggleterm.nvim", config = "require('toggleterm-config')"}
  
  -- whichkey
  use {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"}

end)
