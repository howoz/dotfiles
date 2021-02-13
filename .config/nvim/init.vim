set autowrite
set clipboard=unnamedplus
set confirm
set cursorline
set fileignorecase
set hidden
set ignorecase
set nomodeline
set noshowmode
set noswapfile
set number
set relativenumber
set signcolumn=yes
set smartindent
set shada=
set shadafile=
set shortmess+=c
set smartcase
set splitbelow
set splitright
set switchbuf=usetab
set title
set updatetime=300
set wildignorecase
set wildmode=longest:full,full

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/suda.vim'

call plug#end()

colorscheme gruvbox
highlight CursorLine guibg=#3c3836 ctermbg=8

if $TERM ==# "linux" && empty($DISPLAY)
        set notermguicolors
else
        set termguicolors
endif

let g:mapleader = ","
let g:lightline = {'colorscheme': 'gruvbox'}

cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('SudaWrite'):('W'))
cnoreabbrev <expr> R ((getcmdtype() is# ':' && getcmdline() is# 'R')?('SudaRead'):('R'))

nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>

