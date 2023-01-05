return {
	{ -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration, makes nvim stuff amazing
			'folke/neodev.nvim',
		},
	},

	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},

	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			"windwp/nvim-ts-autotag"
		},
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},

	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'lewis6991/gitsigns.nvim',

	'navarasu/onedark.nvim', -- Theme inspired by Atom
	'nvim-lualine/lualine.nvim', -- Fancier statusline
	'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
	'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
	'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

	"Mofiqul/dracula.nvim",
	'sgur/vim-editorconfig',
	'christoomey/vim-tmux-navigator',
	'nvim-telescope/telescope-file-browser.nvim',
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup({})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			require("null-ls").setup({
				sources = {
					-- formatting.stylua,
					-- formatting.prettier.with({
					-- 	condition = function(utils)
					-- 		return utils.root_has_file(".prettierrc")
					-- 	end,
					-- }),
					formatting.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file(".eslintrc.js")
						end,
					}),
					diagnostics.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file(".eslintrc.js")
						end,
					}),
					-- formatting.eslint_d,
					-- diagnostics.eslint_d
				},
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "prettier", "eslint", "eslint_d" },
			})
		end,
	},
	"windwp/nvim-autopairs",
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- },
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	"kevinhwang91/nvim-bqf",
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function() 
			require("treesitter-context").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"princejoogie/dir-telescope.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({
				hidden = true,
				respect_gitignore = true,
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
		require("leap").add_default_mappings()
		end,
	},
	{
		"dstein64/vim-startuptime",
		cmd = { "StartupTime" },
	}
}
