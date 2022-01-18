require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- https://github.com/simrat39/symbols-outline.nvim
		-- https://github.com/nvim-orgmode/orgmode

		use({
			"dracula/vim",
			as = "dracula",
			config = function()
				vim.g.dracula_colorterm = 0
				vim.g.dracula_italic = 1
				vim.cmd("colorscheme dracula")
			end,
		})

		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
			},
			config = function()
				require("telescope").load_extension("file_browser")
			end,
		})

		use("TimUntersberger/neogit")

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("custom.treesitter")
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
				require("custom.null-ls")
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
				require("custom.cmp")
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("lualine").setup({
					options = {
						theme = "dracula",
						disabled_types = { "NvimTree" },
					},
					sections = {
						lualine_b = { "diff", "diagnostics" },
						lualine_x = { "filetype" },
					},
				})
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
			"neovim/nvim-lspconfig",
			"williamboman/nvim-lsp-installer",
			config = function()
				require("custom.lsp")
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
				local dashboard = require("alpha.themes.dashboard")
				dashboard.section.header.val = {
					"                                                     ",
					"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
					"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
					"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
					"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
					"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
					"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
					"                                                     ",
				}
				dashboard.section.buttons.val = {
					dashboard.button("e", "  New file", ":ene<cr>"),
					dashboard.button("<C-n>", "  File Explorer"),
					dashboard.button("<Leader>ff", "  Find File"),
					dashboard.button("<Leader>fg", "  Find Word"),
					dashboard.button("<Leader>ps", "  Update plugins", ":PackerSync<cr>"),
					dashboard.button("<Leader>fh", "  Recent Files"),
					dashboard.button("q", "  Quit", ":qa<cr>"),
				}
				dashboard.section.footer.val = function()
					local total_plugins = #vim.tbl_keys(packer_plugins)
					local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
					return "\n"
						.. datetime
						.. "   "
						.. total_plugins
						.. " plugins"
						.. "   v"
						.. vim.version().major
						.. "."
						.. vim.version().minor
						.. "."
						.. vim.version().patch
				end
				require("alpha").setup(dashboard.opts)
			end,
		})

		use({
			"monaqa/dial.nvim",
			config = function()
				local dial = require("dial")
				dial.augends["custom#boolean"] = dial.common.enum_cyclic({
					name = "boolean",
					strlist = { "true", "false" },
				})
				table.insert(dial.config.searchlist.normal, "custom#boolean")
			end,
		})

		use({
			"folke/zen-mode.nvim",
			cmd = "ZenMode",
			config = function()
				require("zen-mode").setup({})
			end,
		})

		use("dstein64/vim-startuptime")
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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
