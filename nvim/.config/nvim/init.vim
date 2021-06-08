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
set updatetime=50 " 50 or 750
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
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'justinmk/vim-sneak'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'lewis6991/gitsigns.nvim'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'psliwka/vim-smoothie'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-test/vim-test'
Plug 'charliesbot/night-owl.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tpope/vim-speeddating'
Plug 'ThePrimeagen/harpoon'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'yamatsum/nvim-cursorline'

call plug#end()

let mapleader = " "

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

nnoremap <leader>v :e $MYVIMRC<CR>

" lewis6991/gitsigns.nvim
lua << EOF
 require('gitsigns').setup({})
EOF

" tpope/vim-fugitive
nnoremap <leader>gg :G<cr>

" neovim/nvim-lspconfig
lua require'lspconfig'.tsserver.setup{}

nnoremap <Leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" justinmk/vim-sneak
let g:sneak#label = 1

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
nnoremap <silent> tt :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> t_ :TestLast<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"
let g:test#javascript#runner = 'jest'
let g:test#javascript#jest#executable = 'npx jest --config ./config/jest/jest.config.json'

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

" vim-airline/vim-airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" peitalin/vim-jsx-typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

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
let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
" Toggle (find current buffer in tree when opening)
nnoremap <leader>n :call MyNerdToggle()<CR>

" tpope/vim-commentary
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" When highlighting search terms, make sure text is contrasting color
:highlight Search ctermbg=yellow ctermfg=black
:highlight Search guibg=yellow guifg=black

if (has("termguicolors"))
  set termguicolors     " enable true colors support
endif
" `:hi Normal` and replace guibg with none
highlight Normal           guifg=#e6e1de ctermfg=none guibg=none

colorscheme night-owl

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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set colorcolumn=80
highlight ColorColumn guibg=Black

set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line

