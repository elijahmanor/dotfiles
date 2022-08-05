require("impatient")

require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		use({ "lewis6991/impatient.nvim" })

		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("toggleterm").setup({})
			end,
		})

		use({ "nathom/filetype.nvim" })

		use({
			"dstein64/vim-startuptime",
			opt = true,
			cmd = { "StartupTime" },
		})

		use({
			"rcarriga/nvim-notify",
			commit = "2cfd425",
			config = function()
				vim.notify = require("notify")
			end,
		})

		-- use({ "github/copilot.vim" })

		use {
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig"
		}

		use({
			"gruvbox-community/gruvbox",
			config = function ()
				vim.cmd([[
					" set background=dark
					" set background=light
					" colorscheme gruvbox
				]])
			end
		})

		use({
			"marko-cerovac/material.nvim",
			config = function()
				vim.g.material_style = "deep ocean"
				-- vim.g.material_style = "oceanic"
				-- vim.g.material_style = "palenight"
				-- vim.g.material_style = "lighter"
				-- vim.g.material_style = "darker"
				-- vim.cmd 'colorscheme material'
			end
		})

		use({
			"dracula/vim",
			as = "dracula",
			config = function()
				vim.g.dracula_italic = 1
				vim.cmd("colorscheme dracula")
			end,
		})

		use ({
			'TimUntersberger/neogit',
			requires = {
				'nvim-lua/plenary.nvim',
				'sindrets/diffview.nvim'
			},
			config = function()
				local neogit = require('neogit')
				neogit.setup({
					  integrations = {
						diffview = true
					  }
				})
			end
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

		use({ "christoomey/vim-tmux-navigator" })

		use({ "kevinhwang91/nvim-bqf", ft = "qf" })

		use({
			"junegunn/fzf",
			run = function()
				vim.fn["fzf#install"]()
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("custom.plugins.treesitter")
			end,
		})

		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup({})
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
			opt = true,
			keys = { "gc", "gcc", "gbc" },
			config = function()
				require("Comment").setup()
			end,
		})

		-- use({
		-- 	"jose-elias-alvarez/null-ls.nvim",
		-- 	config = function()
		-- 		require("custom.plugins.null-ls")
		-- 	end
		-- })

		use({
			"hrsh7th/nvim-cmp",
			-- opt = true,
			-- event = "InsertEnter",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
			config = function()
				require("custom.plugins.cmp")
			end,
		})

		use({
		  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		  config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({
			  virtual_text = false,
			})
		  end,
		})

        use ( { 
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup {
					show_current_context = true,
					show_current_context_start = true,
				}
			end
		})

		use({
			"nvim-lualine/lualine.nvim",
			opt = true,
			event = "VimEnter",
			after = "nvim-treesitter",
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
			"williamboman/mason.nvim",
			requires = {
			  "williamboman/mason-lspconfig.nvim",
			  "neovim/nvim-lspconfig",
			},
			config = function()
				require("custom.plugins.mason")
				-- require("mason").setup()
				-- mason_lspconfig = require("mason-lspconfig")
				-- mason_lspconfig.setup({
				--   ensure_installed = {
				-- 	"eslint-lsp",
				-- 	"rome",
				-- 	"terraform-ls",
				-- 	"tflint",
				-- 	"typescript-language-server",
				-- 	"yaml-language-server",
				-- 	"yamllint",
				--   }
				-- })
				-- mason_lspconfig.setup_handlers({
				--   function (server_name)
				-- 	require("lspconfig")[server_name].setup {
				-- 	  on_attach = require("shared").on_attach,
				-- 	}
				--   end
				-- })
			end,
		})

		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({})
			end,
		})

		-- use({
		-- 	"neovim/nvim-lspconfig",
		-- 	opt = true,
		-- 	event = { "BufReadPre" },
		-- 	wants = {
		-- 		"nvim-lsp-installer",
		-- 		"cmp-nvim-lsp",
		-- 		"null-ls.nvim",
		-- 	},
		-- 	config = function()
		-- 		require("custom.plugins.lsp")
		-- 	end,
		-- 	requires = {
		-- 		"williamboman/nvim-lsp-installer",
		-- 		"jose-elias-alvarez/null-ls.nvim",
		-- 	},
		-- })

		use({
			"ggandor/leap.nvim",
			opt = true,
			keys = { "s", "S" },
			config = function()
				require("leap").set_default_keymaps()
			end,
		})

		use({
			"folke/which-key.nvim",
			opt = true,
			event = "VimEnter",
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
			"ThePrimeagen/harpoon",
			requires = { "nvim-lua/plenary.nvim" },
		})

		use({ "godlygeek/tabular" })


		use({
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		use( { 'anuvyklack/pretty-fold.nvim',
		   requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
		   config = function()
				require("pretty-fold").setup({
					keep_indentation = false,
					fill_char = "━",
					sections = {
						left = {
							"━ ",
							function()
								return string.rep("*", vim.v.foldlevel)
							end,
							" ━┫",
							"content",
							"┣",
						},
						right = {
							"┫ ",
							"number_of_folded_lines",
							": ",
							"percentage",
							" ┣━━",
						},
					},
				})
		   end
		} )

		use({ "nvim-pack/nvim-spectre" })

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})

		use({ "stevearc/dressing.nvim" })

		use({
			"sidebar-nvim/sidebar.nvim",
			config = function()
				require("sidebar-nvim").setup({
					sections = { "datetime", "git", "diagnostics", "symbols", "todos", "containers", "buffers", "files" },
				})
			end,
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

