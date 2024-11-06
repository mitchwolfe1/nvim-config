-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- use({ 
	 --  "rose-pine/neovim", 
	 --  as = "rose-pine", 
	 --  config = function()
		--   vim.cmd('colorscheme rose-pine')					
	 --  end
  -- })
  -- use({ 
	 --  "rebelot/kanagawa.nvim", 
	 --  as = "kanagawa", 
	 --  config = function()
		--   vim.cmd('colorscheme kanagawa')					
	 --  end
  -- })

  use {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("flow").setup{
        transparent = false, -- Set transparent background.
        fluo_color = "orange", -- Fluo color: pink, yellow, orange, or green.
        mode = "normal", -- Intensity of the palette: normal, bright, desaturate, or dark.
        aggressive_spell = false, -- Display colors for spell check.
      }
      vim.cmd "colorscheme flow"
    end,
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    "numToStr/Comment.nvim",
      config = function()
        require('Comment').setup()
      end
  }

  use({
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      after = "nvim-web-devicons", -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup()
      end,
    })

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- Your configuration here
      }
    end
  }

end)

