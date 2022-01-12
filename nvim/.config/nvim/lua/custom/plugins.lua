require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
		use({ "dracula/vim", as = "dracula" })

		use("nvim-telescope/telescope-file-browser.nvim")
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
			config = function()
				require("telescope").load_extension("file_browser")
			end,
		})

		use("TimUntersberger/neogit")

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})

		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup({})
			end,
		})

		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("nvim-tree").setup({})
			end,
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("gitsigns").setup()
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		use("jose-elias-alvarez/null-ls.nvim")

		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/vim-vsnip")
		use("rafamadriz/friendly-snippets")

		use({
			"neovim/nvim-lspconfig",
			"williamboman/nvim-lsp-installer",
		})

		use("dstein64/vim-startuptime")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
