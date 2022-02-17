local cmp = require("cmp")

require("luasnip.loaders.from_vscode").load()

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = 'luasnip' },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
	view = {
		entries = "native"
	},
	experimental = {
		ghost_text = true,
	},
})

-- vim.api.nvim_set_keymap('i', '<C-E>', '<cmd>lua require("luasnip").jump()<cr>', {})
vim.api.nvim_set_keymap('i', '<C-k>', '<plug>luasnip-expand-or-jump', {})
vim.api.nvim_set_keymap('s', '<C-k>', '<plug>luasnip-expand-or-jump', {})
-- vim.api.nvim_set_keymap('i', '<C-j>', '<plug>luasnip-jump-prev', {})
-- vim.api.nvim_set_keymap('s', '<C-j>', '<plug>luasnip-jump-prev', {})

