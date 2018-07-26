set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
" Plugin 'scrooloose/nerdtree'

" Python Plugins
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'

" Latex Plugins
Plugin 'lervag/vimtex'

call vundle#end()            " required
filetype plugin indent on    " required
set encoding=utf-8

" THEME
syntax enable
" set t_Co=256
" set background=dark
colorscheme hybrid_reverse

" INDENTATION
set autoindent " set auto indent
set expandtab " use spaces instead of tabs
set shiftwidth=4 " number of auto-indent spaces
set softtabstop=4 " number of spaces per tab
set tabstop=4 " length of the tab

" Other stuff
set clipboard=unnamedplus " use the system clipboard
set hlsearch " highlight all search matches
set ignorecase " ignore case in search
set incsearch " show search results as I type
set laststatus=2
set mouse=a " enable mouse support
set nocompatible " don't need to be compatible with old vim
set nofoldenable " disable code folding
set number
set relativenumber
set ruler " show row and column in footer
set scrolloff=2 " minimum lines above/below cursor
set showmatch " show bracket matches
set smartcase " pay attention to case when caps are used
set ttimeoutlen=100 " decrease timeout for faster insert with 'O'
set vb " enable visual bell (disable audio bell)
set wildmenu " enable bash style tab completion
set wildmode=list:longest,full

" remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" autoreload vimrc after cache
autocmd! bufwritepost .vimrc source %
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" gitgutter realtime
let g:gitgutter_realtime = 750
let g:gitgutter_eager = 750

" ctrlp
let g:ctrlp_extensions        = ['tag']
let g:ctrlp_match_window      = 'bottom,order:ttb'
let g:ctrlp_switch_buffer     = 0
let g:ctrlp_use_caching       = 0
let g:ctrlp_user_command      = 'ag %s --files-with-matches --ignore tags --ignore tmp --nocolor -g ""'
let g:ctrlp_working_path_mode = 0

""
"" Backup and swap files
""
set backupdir=/tmp// " where to put backup files.
set undodir=/tmp//
set directory=/tmp// " where to put swap files.

let mapleader=" "

" shortcuts
map <Leader><Space> :noh<CR>
map <Leader><Tab> <C-^>

" Python Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" let python_highlight_all=1

" latex YCM
let g:tex_flavor='latex'

" Shortcut for compiling files
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java -cp %:p:h %:t:r"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
