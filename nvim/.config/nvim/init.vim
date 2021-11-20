"         
" ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
" ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
" ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
" ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
" 
"         @elijahmanor

" Sets {{{
set exrc
set relativenumber
set nu
set nohlsearch
set mouse=a
set hidden
set splitright
set splitbelow
set noerrorbells
set nowrap
set formatoptions-=t
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=2
set noshowmode
set completeopt=menu,menuone,noselect
set signcolumn=yes
set number
set updatetime=50
set encoding=UTF-8
set clipboard+=unnamedplus " Copy paste between vim and everything else
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line
set wildignore+=*/node_modules/**
filetype plugin indent on

" folding
" set foldmethod=syntax "syntax highlighting items specify folds  
" set foldcolumn=1 "defines 1 col at window left, to indicate folding  
" let javaScript_fold=1 "activate folding by JS syntax  
" set foldlevelstart=99 "start file with all folds opened

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" for demo
" set expandtab
" set tabstop=2
" set softtabstop=2
" set shiftwidth=2
" set smartindent

" attempt to speed-up vim
set ttyfast
set lazyredraw
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
" PlugInstall PlugClean PlugUpdate

" Dashboard
Plug 'glepnir/dashboard-nvim'

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'tami5/lspsaga.nvim'
Plug 'folke/trouble.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'creativenull/diagnosticls-configs-nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'David-Kunz/cmp-npm'

" File Management
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-hop.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ThePrimeagen/harpoon'

" TEMPORARY FOR RECORDING"
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'windwp/nvim-spectre'
" nnoremap <leader>S :lua require('spectre').open()<CR>

" Custom Text Objects
Plug 'michaeljsmith/vim-indent-object' " gcii gcaI
Plug 'kana/vim-textobj-user'

" Custom Motions
Plug 'christoomey/vim-sort-motion' " gsip gsii
Plug 'tommcdo/vim-exchange' " cxiw ., cxx ., cxc

" https://github.com/nvim-treesitter/nvim-treesitter/issues/1111
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'MaxMEllon/vim-jsx-pretty' " fix indentation in jsx until treesitter can
Plug 'jxnblk/vim-mdx-js'
" Plug 'code-biscuits/nvim-biscuits'

" Status Line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" tmux plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'

" tpope plugins
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'
" Plug 'APZelos/blamer.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'vimwiki/vimwiki', { 'on': ['VimwikiIndex'] }
Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
Plug 'machakann/vim-highlightedyank'
" Plug 'folke/which-key.nvim'
Plug 'wesQ3/vim-windowswap' " <leader>ww
Plug 'justinmk/vim-sneak'
" Plug 'tweekmonster/startuptime.vim'
Plug 'dstein64/vim-startuptime'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'windwp/nvim-autopairs'
Plug 'junegunn/goyo.vim'
Plug 'miyakogi/conoline.vim'
" Plug 'github/copilot.vim'
Plug 'yamatsum/nvim-cursorline'
Plug 'mattn/emmet-vim'
Plug 'voldikss/vim-floaterm'
Plug 'sindrets/diffview.nvim'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'npxbr/gruvbox.nvim'
" Plug 'tjdevries/colorbuddy.vim'
" Plug 'Th3Whit3Wolf/onebuddy'
" Plug 'projekt0n/github-nvim-theme'

Plug 'elijahmanor/export-to-vscode.nvim'

call plug#end()
" }}}

nnoremap <silent> <leader>code <cmd>lua require('export-to-vscode').launch()<cr>
lua << EOF
--vim.api.nvim_set_keymap(
--  'n',
--  '<leader>code',
--  '<cmd>lua require("export-to-vscode").launch()<cr>',
--  { noremap = true, silent = true }
--)
EOF

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula
" set background=dark " light or dark
" colorscheme onebuddy
"

lua << EOF
--require('github-theme').setup({
--  theme_style = "dark_default", -- dark/dark_default/dimmed/light/light_default
--  function_style = "italic",
--  sidebars = {"qf", "vista_kind", "terminal", "packer"},
--  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--  colors = {hint = "orange", error = "#ff0000"}
--})
EOF

highlight Cursor guifg=#f00 guibg=#657b83
highlight Comment cterm=italic gui=italic

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set colorcolumn=80
highlight ColorColumn guibg=#181818
" }}}

" Leader {{{
let mapleader = " "
"}}}

" justinmk/vim-sneak {{{
let g:sneak#label = 1
" }}}

" Plug 'onsails/lspkind-nvim' {{{
lua << EOF
require('lspkind').init({})
EOF
" }}}

" Plug 'windwp/nvim-autopairs' {{{
lua << EOF
require('nvim-autopairs').setup()
EOF
" }}}

" Plug 'nvim-biscuits' {{{
lua <<EOF
-- require('nvim-biscuits').setup({
--   default_config = {
--     max_length = 12,
--     min_distance = 5,
--     prefix_string = " 📎 "
--   },
--   language_config = {
--     html = {
--       prefix_string = " 🌐 "
--     },
--     javascript = {
--       prefix_string = " ✨ ",
--       max_length = 80
--     },
--     python = {
--       disabled = true
--     }
--   }
-- })
EOF
" }}}

" 'akinsho/nvim-bufferline.lua' {{{
lua << EOF
vim.api.nvim_exec([[let $KITTY_WINDOW_ID=0]], true)
require("bufferline").setup{
  highlights = {
    fill = {
      guibg = "#282828"
    },
    separator_selected = {
      guifg = "#282828"
    },
    separator_visible = {
      guifg = "#282828"
    },
    separator = {
      guifg = "#282828"
    }
  },
  options = {
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 25,
    max_prefix_length = 25,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {
      {
        filetype = "coc-explorer",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    }
  }
}
EOF
nnoremap <silent> gb :BufferLinePick<CR>
" }}}

" Plug 'APZelos/blamer.nvim' {{{
let g:blamer_enabled = 1
nnoremap <silent> <leader>tb :BlamerToggle<CR>
" }}}

" norcalli/nvim-colorizer.lua {{{
lua require'colorizer'.setup()
" }}}

" lewis6991/gitsigns.nvim {{{
lua << EOF
  require('gitsigns').setup({})
EOF
" }}}

" Plug 'karb94/neoscroll.nvim'{{{
lua require('neoscroll').setup()
" }}}

" neovim/nvim-lspconfig {{{
" npm i -g typescript typescript-language-server
lua << EOF
local util = require "lspconfig/util"
require 'lspconfig'.tsserver.setup{
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
    --[=====[ 
    handlers = {
      ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
        local ignore_codes = { 80001, 7016 };
        if params.diagnostics ~= nil then
          local idx = 1
          while idx <= #params.diagnostics do
            if vim.tbl_contains(ignore_codes, params.diagnostics[idx].code) then
              table.remove(params.diagnostics, idx)
            else
              idx = idx + 1
            end 
          end
        end
        vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
      end,
    },
    --]=====]
}
EOF

lua << EOF
-- npm install -g diagnostic-languageserver eslint_d prettier_d_slim prettier
local function on_attach(client)
  print('Attached to ' .. client.name)
end
local dlsconfig = require 'diagnosticls-configs'
dlsconfig.init {
  default_config = false,
  format = true,
  on_attach = on_attach,
}
local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier = require 'diagnosticls-configs.formatters.prettier'
prettier.requiredFiles = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.toml',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
  }
dlsconfig.setup {
  ['javascript'] = {
    linter = eslint,
    formatter = { prettier }
  },
  ['javascriptreact'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['css'] = {
    formatter = prettier
  },
  ['html'] = {
    formatter = prettier
  },
}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gca   <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>fo <cmd>lua vim.lsp.buf.formatting()<CR>
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.css lua vim.lsp.buf.formatting()

lua << EOF
require 'trouble'.setup {}
EOF
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }}}

" kabouzeid/nvim-lspinstall {{{
lua << EOF
require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end
EOF
" }}}

" emmet-ls {{{
lua << EOF
-- npm install -g ls_emmet
-- local lspconfig = require'lspconfig'
-- local configs = require'lspconfig/configs'
-- 
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 
-- configs.ls_emmet = {
--   default_config = {
--     cmd = { 'ls_emmet', '--stdio' };
--     filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
--       'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
--     root_dir = function(fname)
--       return vim.loop.cwd()
--     end;
--     settings = {};
--   };
-- }
-- 
-- lspconfig.ls_emmet.setup{ capabilities = capabilities }
EOF
" }}}

" ThePrimeagen/harpoon {{{
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
" }}}

" folke/wich-key.nvim {{{
lua << EOF
-- require("which-key").setup {}
EOF
" }}}

" nvim-telescope/telescope.nvim {{{
lua << EOF
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "yarn.lock" }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      -- theme = "dropdown",
      -- previewer = false,
      mappings = {
        i = {
          ["<M-d>"] = "delete_buffer",
        }
      }
    }
  }
}
require('telescope').load_extension('fzf')
EOF
nnoremap <leader>ps :lua require('telescope.builtin').grep_string( { search = vim.fn.input("Grep for > ") } )<cr>
nnoremap <leader>ff :lua require'telescope.builtin'.find_files{ hidden = true, file_ignore_patterns = { '**/*.spec.js' } }<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fs :lua require'telescope.builtin'.file_browser{ cwd = vim.fn.expand('%:p:h') }<cr>
nnoremap <Leader>fc :lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>cb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>fr :lua require'telescope.builtin'.resume{}<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { '**/*.spec.js' } } )<cr>
nnoremap <leader>fgd :lua require'telescope.builtin'.live_grep{ search_dirs = { 'slices/admin' } }

nnoremap <leader>cheat :Cheatsheet<cr>
nnoremap <leader>fw <cmd>Telescope tmux windows<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fm :lua require('telescope').extensions.harpoon.marks{}<cr>
"}}}

" janko/vim-test {{{
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"
let g:test#javascript#runner = 'jest'
" https://github.com/vim-test/vim-test/issues/272
let g:root_markers = ['package.json', '.git/']
function! s:RunVimTest(cmd)
    " I guess this part could be replaced by projectionist#project_root
    for marker in g:root_markers
        let marker_file = findfile(marker, expand('%:p:h') . ';')
        if strlen(marker_file) > 0
            let g:test#project_root = fnamemodify(marker_file, ":p:h")
            break
        endif
        let marker_dir = finddir(marker, expand('%:p:h') . ';')
        if strlen(marker_dir) > 0
            let g:test#project_root = fnamemodify(marker_dir, ":p:h")
            break
        endif
    endfor

    execute a:cmd
endfunction
nnoremap <leader>tt :call <SID>RunVimTest('TestNearest')<cr>
nnoremap <leader>tl :call <SID>RunVimTest('TestLast')<cr>
nnoremap <leader>tf :call <SID>RunVimTest('TestFile')<cr>
nnoremap <leader>ts :call <SID>RunVimTest('TestSuite')<cr>
nnoremap <leader>tv :call <SID>RunVimTest('TestVisit')<cr>
"}}}

" 'hrsh7th/nvim-cmp' {{{
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    auto_select = false,
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      --['<C-Space>'] = cmp.mapping.complete(),
      ['<C-x>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      --['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<C-y>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,        
        select = true
      }),
    },
    sources = {
      { name = 'nvim_lsp' },
      -- For vsnip user.
      -- { name = 'vsnip' },
      -- For luasnip user.
      { name = 'path' },
      -- For ultisnips user.
      -- { name = 'ultisnips' },
      { name = 'luasnip' },
      { name = 'buffer', keywork_length = 5 },
      { name = 'npm', keyword_length = 4 },
    },
    formatting = {
      -- format = require('lspkind').cmp_format {
      --   with_text = true,
      --   menu = {
      --     buffer = "[buf]",
      --     nvim_lsp = "[LSP]",
      --     path = "[path]",
      --     luasnip = "[snip]"
      --   }
      -- }
    },
    experimental = {
      native_menu = false,
      ghost_text = true
    }
  })
EOF

" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'html', 'javascript', 'typescript', 'tsx', 'css', 'json' },
  -- ensure_installed = "all", -- or maintained
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false
  },
  context_commentstring = {
    enable = true
  }
}
EOF
" }}}

" Plug 'hoob3rt/lualine.nvim' {{{
lua << EOF
require('plenary.reload').reload_module('lualine', true)
require('lualine').setup({
  options = {
    theme = 'dracula',
    disabled_types = { 'NvimTree' }
  },
  sections = {
    lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {},
  }
})
EOF
" }}}

" peitalin/vim-jsx-typescript {{{
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" }}}

" vimwiki/vimwiki {{{
nnoremap <leader>vw :VimwikiIndex<CR>
nnoremap <leader>tl :VimwikiToggleListItem<cr>
"}}}

" 'glephir/dashboard-nvim' {{{
let g:dashboard_default_executive ='telescope'
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>ct :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fg :DashboardFindWord<CR>
nnoremap <silent> <Leader>fm :DashboardJumpMark<CR>
nnoremap <silent> <Leader>nf :DashboardNewFile<CR>
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC n f',
\ 'change_colorscheme' : 'SPC c t',
\ 'find_word'          : 'SPC f g',
\ 'book_marks'         : 'SPC f m',
\ }
let s:header = [
    \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ '',
    \ '                 [ @elijahmanor ]                 ',
    \ ]
let s:footer = []
let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer
" }}}

" kyazdani42/nvim-tree.lua {{{
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
" let g:nvim_tree_auto_close = 1
" let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_group_empty = 1
" let g:nvim_tree_lsp_diagnostics = 1

lua << EOF
require'nvim-tree'.setup {
  auto_close = true,
  -- lsp_diagnostics = true,
  ignore_ft_on_setup  = { 'startify', 'dashboard' },
}
EOF

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
"}}}

" tpope/vim-commentary {{{
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
"}}}

" Remaps {{{
inoremap jj <ESC> " jj to Escape

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Escape terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" resize current buffer by +/- 5 
nnoremap <M-Right> :vertical resize -5<cr>
nnoremap <M-Up> :resize +5<cr>
nnoremap <M-Down> :resize -5<cr>
nnoremap <M-Left> :vertical resize +5<cr>

" toggle relativenumber
nnoremap <leader>tn :set invrelativenumber<cr>

" toggle word wrap
nnoremap <leader>tw :set wrap!<cr>

" clear and redraw screen, de-highlight, fix syntax highlighting
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" nnoremap gp `[v`] " reselect pasted text

nnoremap <leader>id :r!date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>
" nnoremap id "=strftime("%FT%T%z")<CR>P

nnoremap <leader>x :!chmod +x %<cr>
" }}}

" Autocmd {{{
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣
autocmd InsertEnter * set list
autocmd VimEnter,BufEnter,InsertLeave * set nolist
autocmd BufNewFile,BufRead *.md,*.mdx,*.markdown :set filetype=markdown
" }}}

" Abbreviations {{{
iabbrev @@ emanor@planview.com
" }}}

" Snippets {{{
nnoremap ,desc :-1read $HOME/.config/snippets/describe.snip<CR>V2j=f"a
nnoremap ,it   :-1read $HOME/.config/snippets/it.snip<CR>V2j=f";i
nnoremap ,test :-1read $HOME/.config/snippets/test.snip<CR>V2j=f";i
" }}}

" https://vi.stackexchange.com/questions/3814/is-there-a-best-practice-to-fold-a-vimrc-file
" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3
