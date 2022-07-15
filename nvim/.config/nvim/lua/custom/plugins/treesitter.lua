 require("nvim-treesitter.configs").setup( {
  ensure_installed = { "css", "html", "javascript", "jsdoc", "json", "lua", "markdown", "scss", "rust", "tsx", "typescript", "vim", "yaml" },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false
  },
  indent = { -- is this native or a plugin?
	  enable = true
  },
  context_commentstring = { -- this is an extension... TODO, install
	  enable = true
  }
} )
