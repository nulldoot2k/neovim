--#####################################################################################################
--                           ____     __                     _
--                          / __ \   / /  __  __   ____ _   (_)   ____    _____
--                         / /_/ /  / /  / / / /  / __ `/  / /   / __ \  / ___/
--                        / ____/  / /  / /_/ /  / /_/ /  / /   / / / / (__  )
--                       /_/      /_/   \__,_/   \__, /  /_/   /_/ /_/ /____/
--                                              /____/
--######################################################################################################

local fn = vim.fn
-- Linux 
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
   if fn.empty(vim.fn.glob(install_path)) > 0 then
      fn.execute({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.api.nvim_command('packadd packer.nvim')
  end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {'windwp/nvim-autopairs', config = "require('autopairs-config')", after = "nvim-cmp"}
  use {'hrsh7th/nvim-cmp'}
  use {'neovim/nvim-lspconfig',
    config = "require('lsp')"
  }
  use {'williamboman/nvim-lsp-installer'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-vsnip'}
  use {'onsails/lspkind-nvim'}
  use {'hrsh7th/vim-vsnip'}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('treesitter-config')"
  }
  use {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter"}

  -- comment --
  use {"terrortylor/nvim-comment",
    config ="require('comment-config')"
  }
  -- which key --
  use {'folke/which-key.nvim', 
    event = "BufWinEnter", 
    config = "require('whichkey-config')"
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = "require('nvim-tree-config')"
  }

  use {
    'davidgranstrom/nvim-markdown-preview'}

  -- color
  use { 'folke/tokyonight.nvim'}

  use { "akinsho/toggleterm.nvim", 
    tag = '*', 
    config = "require('toggleterm')" }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, { "kdheepak/lazygit.nvim" } },
    cmd = "Telescope",
    -- config = "require('telescope-config')"
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  }
end)
