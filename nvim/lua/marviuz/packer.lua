-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({ "williamboman/mason.nvim", run = ":MasonUpdate" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Formatting/linting
			{ "jose-elias-alvarez/null-ls.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},

		use({ "ellisonleao/gruvbox.nvim" }),

		use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" }),
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
		}),

		use("mbbill/undotree"),

		use("mg979/vim-visual-multi"),

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
		}),

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		}),
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("windwp/nvim-ts-autotag")
	use("lewis6991/gitsigns.nvim")
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
			"antosha417/nvim-lsp-file-operations",
			"echasnovski/mini.base16",
		},
	})
	use("andweeb/presence.nvim")
	use("tpope/vim-fugitive")
	use("folke/neodev.nvim", {
    config = function () 
      require('neodev').setup({})
    end
  })
end)
