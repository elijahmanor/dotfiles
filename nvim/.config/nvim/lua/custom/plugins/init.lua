require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		use({
			"dracula/vim",
			as = "dracula",
			config = function()
				vim.g.dracula_colorterm = 0
				vim.g.dracula_italic = 1
				vim.cmd("colorscheme dracula")
			end,
		})

		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
			},
			config = function()
				require("custom.plugins.telescope")
			end,
		})

		use("christoomey/vim-tmux-navigator")

		use("TimUntersberger/neogit")

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("custom.plugins.treesitter")
			end,
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

		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.plugins.null-ls")
			end,
		})

		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/vim-vsnip",
				"rafamadriz/friendly-snippets",
			},
			config = function()
				require("custom.plugins.cmp")
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("custom.plugins.lualine")
			end,
		})

		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("bufferline").setup({})
			end,
		})

		use({
			"williamboman/nvim-lsp-installer",
			requires = { "neovim/nvim-lspconfig" },
			config = function()
				require("custom.plugins.lsp")
			end,
		})

		use({
			"phaazon/hop.nvim",
			config = function()
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})

		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({})
			end,
		})

		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("custom.plugins.alpha")
			end,
		})

		use({
			"sidebar-nvim/sidebar.nvim",
			config = function()
				require("sidebar-nvim").setup({
					sections = { "git", "diagnostics", "symbols", "todos", "buffers" },
					section_separator = "-----",
				})
			end,
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				vim.g.indent_blankline_filetype_exclude = { "lspinfo", "packer", "checkhealth", "help", "alpha" }
				require("indent_blankline").setup({})
			end,
		})

		use({
			"simrat39/symbols-outline.nvim",
		})

		use({
			"godlygeek/tabular",
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
		profile = {
			enable = true,
			threshold = 1,
		},
	},
})
