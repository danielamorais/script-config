execute pathogen#infect()
set dir=~/.vim/_swap/
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smartcase
syntax on
set updatetime=200
set hlsearch
set incsearch
set nu
set cursorline
set laststatus=2
hi Search ctermbg=None ctermfg=yellow
let g:syntastic_mode_map = {
\ "mode": "passive",
\ "active_filetypes": [],
\ "passive_filetypes": []}
nnoremap J :s/.*\zs;//<Enter> J<Enter>
nnoremap <expr> J getline(".")[col("$")-2] == ';' ? ':s/.*\zs;//<Enter>J<Enter>' : 'J<Enter>'
command SC SyntasticCheck
hi MatchParen cterm=none ctermbg=darkblue ctermfg=white
noremap Y y$
set backspace=indent,eol,start
set lazyredraw " maybe remove this?
command WQ wq
command Wq wq
command Wqa wqa
command W w
command Q q
command QA qa
command Qa qa
set ttyfast
let mapleader = "\<leader>"
" FIX WHOLE FILE - FIXES INDENTING, TRAILING SPACE, AND CONVERTS TABS TO
" SPACES
nnoremap <Leader>f :retab<CR> mzgg=G'z<CR> :%s/\s\+$//<CR>
set timeoutlen=1000 ttimeoutlen=0
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
set pastetoggle=<F2>
nnoremap <CR>f :retab<CR> "changes all tabs to space
