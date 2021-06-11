set exrc
set relativenumber
set nu
set mouse=a
set hidden
set splitright
set splitbelow
set noerrorbells
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect " what?
set signcolumn=yes
set number
set updatetime=100
set encoding=UTF-8
set clipboard=unnamedplus " Copy paste between vim and everything else
filetype plugin indent on

let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw

if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=1                " start folded
endif

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Switch to nvim-treesitter once it supports styled-components
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'justinmk/vim-sneak'
Plug 'editorconfig/editorconfig-vim'

" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kyazdani42/nvim-tree.lua'

" Plug 'itchyny/lightline.vim'
" Plug 'hoob3rt/lualine.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'

" tmux plugins
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'edkolev/tmuxline.vim'


Plug 'wesQ3/vim-windowswap'

" tpope plugins
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'

Plug 'lewis6991/gitsigns.nvim'
Plug 'psliwka/vim-smoothie'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'liuchengxu/vim-which-key'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-test/vim-test'
Plug 'ThePrimeagen/harpoon'
Plug 'rbgrouleff/bclose.vim'

" Plug 'mhartington/formatter.nvim'
" Plug 'AndrewRadev/switch.vim'
" Plug 'mattn/emmet-vim'
" Plug 'rstacruz/vim-closer'
"
Plug 'tweekmonster/startuptime.vim'

" Plug 'joshdick/onedark.vim' " This is slow...
Plug 'lifepillar/vim-gruvbox8'

" And then somewhere in your vimrc, to set the colorscheme
call plug#end()

colorscheme gruvbox8
"
let g:airline_theme='onedark'
let g:tmuxline_theme = 'airline'

" lua << EOF
" require('lualine').setup {
"   options = { theme = 'onedark' }
" }
" EOF

" Allow crosshair cursor highlighting.
set cursorline    " enable the horizontal line
set cursorcolumn  " enable the vertical line
highlight CursorLine   cterm=NONE ctermbg=Black ctermfg=NONE guibg=#17222E guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=Black ctermfg=NONE guibg=#17222E guifg=NONE
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set colorcolumn=80
highlight ColorColumn guibg=#181818

" When highlighting search terms, make sure text is contrasting color
" :highlight Search ctermbg=yellow ctermfg=black
" :highlight Search guibg=yellow guifg=black

if (has("termguicolors"))
  set termguicolors     " enable true colors support
endif
" `:hi Normal` and replace guibg with none
highlight Normal           guifg=#e6e1de ctermfg=none guibg=none


" Leader {{{
let mapleader = " "
"}}}

let g:user_emmet_leader_key='<C-Z>'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

nnoremap <leader>v :e $MYVIMRC<CR>

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" lewis6991/gitsigns.nvim
lua << EOF
 require('gitsigns').setup({})
EOF

" mhartington/formatter.nvim {{{
" lua << EOF
" local eslint = function()
"   return {
"     exe = "npx eslint",
"     args = {"--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix", "--cache"},
"     stdin = false
"   }
" end
" require('formatter').setup({
"   logging = true,
"   filetype = {
"     typescriptreact = { eslint },
"     javascript = { eslint },
" 	}
" })
" vim.api.nvim_exec([[
" augroup FormatAutogroup
"   autocmd!
"   autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
" augroup END
" ]], true)
" EOF
nnoremap <silent> <leader>fo :Format<CR>
"}}}

" tpope/vim-fugitive {{{
nnoremap <leader>gg :G<cr>
"}}}

" neovim/nvim-lspconfig {{{
lua require 'lspconfig'.tsserver.setup{}
lua << EOF
local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}
require "lspconfig".efm.setup {
    init_options = {documentFormatting = true, codeAction = true},
    filetypes = {"javascriptreact", "javascript", "typescript", "typescriptreact"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = {eslint},
            javascriptreact = {eslint},
        }
    }
}
EOF
lua << EOF
require 'lspsaga'.init_lsp_saga()
EOF
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent><leader>ft <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent><leader>ft <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
lua << EOF
require 'trouble'.setup {}
EOF
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
"}}}

" ThePrimeagen/harpoon {{{
nnoremap <Leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
"}}}

inoremap jj <ESC> " jj to Escape

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


" justinmk/vim-sneak
let g:sneak#label = 1

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev @@ emanor@planview.com

" nvim-telescope/telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fgs :lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>ffb :lua require'telescope.builtin'.file_browser{}<cr>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

" janko/vim-test
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

" 'hrsh7th/nvim-compe'
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- treesitter = true;
  };
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = {
"     'html', 'javascript', 'typescript'
"   },
"   highlight = {
"     enable = true,
"     additional_vim_regex_highlighting = true
"   },
"   indent = {
"     enable = false
"   }
" }
" EOF

" vim-airline/vim-airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

" peitalin/vim-jsx-typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Escape terminal mode
tnoremap <Esc> <C-\><C-n>

" vimwiki/vimwiki
nnoremap <leader>vw :VimwikiIndex<CR>

let s:header = [
      \ '',
      \ '__      _______    _____          _      ',
      \ '\ \    / / ____|  / ____|        | |     ',
      \ ' \ \  / / (___   | |     ___   __| | ___ ',
      \ '  \ \/ / \___ \  | |    / _ \ / _` |/ _ \',
      \ '   \  /  ____) | | |___| (_) | (_| |  __/',
      \ '    \/  |_____/   \_____\___/ \__,_|\___|',
      \ '',
      \ '            [ @elijahmanor ]           ',
      \ '',
      \ ]

let s:footer = [
      \ '+-----------------------------------------+',
      \ '|    Doug, this is VS Code... see!?!      |',
      \ '+-----------------------------------------+',
      \ ]

let g:startify_custom_header = startify#center(s:header)
let g:startify_custom_footer = startify#center(s:footer)

" scrooloose/nerdtree
" let NERDTreeShowHidden=1
" let g:NERDTreeMinimalUI = 1
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif
" function MyNerdToggle()
"     if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
"         :NERDTreeToggle
"     else
"         :NERDTreeFind
"     endif
" endfunction
" Toggle (find current buffer in tree when opening)
" nnoremap <leader>n :call MyNerdToggle()<CR>

" kyazdani42/nvim-tree.lua
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" tpope/vim-commentary
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>


" Our remaps
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" resize current buffer by +/- 5 
nnoremap <M-Right> :vertical resize -5<cr>
nnoremap <M-Up> :resize +5<cr>
nnoremap <M-Down> :resize -5<cr>
nnoremap <M-Left> :vertical resize +5<cr>

" Display extra whitespace
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣


set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line

" https://vi.stackexchange.com/questions/3814/is-there-a-best-practice-to-fold-a-vimrc-file
" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3
