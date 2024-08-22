" m0t9_'s .vimrc config

"indent and tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" enable autoindent in scopes
set autoindent
set cindent

" set fount
set guifont=Monaco:h20

" enable relative line numeration 
set nu
set relativenumber

" hide cursor while typing
set mousehide

" enable syntax highlight and setting theme
let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
syntax on

" highlight current line
set cursorline

" always see cursorline below 15 other lines
set scrolloff=15

" incremental search
set incsearch

" Pathogen runtime path
execute pathogen#infect()

" install plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

colorscheme onedark

" enabling lightline and setting up
set laststatus=2
let g:lightline = {
      \ 'colorscheme' : 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], 
      \             [ 'readonly', 'relativepath', 'modified' ] ],
      \ }
      \}

function! LightlineFilename()
  return expand('%:t')
endfunction

set noshowmode

" disable long switch to normal
set ttimeout ttimeoutlen=5

" enable backspacing
set backspace=indent,eol,start
 
" enable column highlight
set colorcolumn=80

" nerdtree settings
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" autocomplete
au filetype go inoremap <buffer> . .<C-x><C-o>
set completeopt-=preview
