local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- color
	use({ "folke/tokyonight.nvim" })

	-- Common utilities
	use("nvim-lua/plenary.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("datv.after.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("datv.after.treesitter")
		end,
	})

	-- auto open and close tag
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("datv.after.autopairs")
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- File manager
  use({
		"nvim-neo-tree/neo-tree.nvim",
		config = function ()
      require("datv.after.neo-tree")
    end,
	 	branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})
		--   	use {
		--     		"nvim-tree/nvim-tree.lua",
		--     		requires = 'nvim-tree/nvim-web-devicons',
		--     		config = function() 
		-- 	require('nvim-tree')
		-- end,
		--   	}

  -- taskbar
  	use {'romgrk/barbar.nvim', requires = {
    		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		config = function()
			require("datv.after.gitsigns")
		end,
    		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  	}}

	-- Background Transparent
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("datv.after.transparent")
		end,
	})

	-- markdown preview
	use({
		"davidgranstrom/nvim-markdown-preview",
	})

	-- Git
	-- use({
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		require("datv.after.gitsigns")
	-- 	end,
	-- })

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("datv.after.toggleterm")
		end,
	})

	-- whichkey
	use({ "folke/which-key.nvim", event = "BufWinEnter", config = "require('datv.after.whichkey')" })

	-- comments
	use({ "terrortylor/nvim-comment", config = "require('datv.after.comment')" })

	-- Show colors
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	-- LSP --
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("datv.after.lsp")
		end,
	})

	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	use("onsails/lspkind-nvim")
	use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
	-- cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("datv.after.cmp")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")

	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	-- LSP diagnostics, code actions, and more via Lua.
	use({
		"jose-elias-alvarez/null-ls.nvim",
		ft = "go",
		config = function()
			require("datv.after.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Mason: Portable package manager
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("datv.after.mason")
		end,
		after = "mason.nvim",
	})

	------

	-- syns packer
	if packer_bootstrap then
		require("packer").sync()
	end
end)
