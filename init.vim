"/-- vim: set foldmethod=marker: --/

" {{{ Default Setting, etc..

" Don't use Ex mode, use Q for formatting
noremap Q gq
set cursorcolumn 
set completeopt-=preview
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" }}}

" {{{ Plugin Manager
call plug#begin('~/.config/nvim/plugged/')
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/davidhalter/jedi-vim'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/easymotion/vim-easymotion'
"Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/flazz/vim-colorschemes'
Plug 'https://github.com/roxma/clang_complete'
Plug 'nine2/vim-copyright'
Plug 'luochen1990/rainbow'
Plug 'yggdroot/indentline'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

inoremap <c-c> <ESC>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
Plug 'ncm2/ncm2-jedi'
call plug#end()
" }}}

" {{{ ale
let g:ale_statusline_format=['x %d', '! %d', 'ok']
let g:ale_open_list=0
" }}}

" {{{ Color Scheme
"set termguicolors
"colorscheme molokai
set t_Co=256
colorscheme gruvbox
set background=dark
" }}}

" {{{ Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
" }}}

" {{{ Window Motion Mapping
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
inoremap <A-h> <C-\><C-n><C-w>h
inoremap <A-j> <C-\><C-n><C-w>j
inoremap <A-k> <C-\><C-n><C-w>k
inoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}

" {{{ NERDTree
map <Leader>nt :NERDTreeToggle<CR>
" }}}

" {{{ Python Setting
" jedi
let g:jedi#completions_enabled = 0
let g:python3_host_prog = '/Users/eskimo/miniconda3/bin/python'
" setting hook
augroup mypython
    autocmd!
    autocmd FileType python setlocal fp=autopep8\ -
augroup END
" }}}

" {{{ cpp Setting
augroup mycpp
    autocmd!
    autocmd FileType cpp setlocal fp=clang-format-3.4\ -style=Google\ -
    autocmd FileType cpp setlocal tabstop=2
    autocmd FileType cpp setlocal shiftwidth=2
augroup END
" }}}

" {{{ Basic Setting

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set number             " show line number
set expandtab          " expand tab as space
set tabstop=4          " set tabstop as 4
set shiftwidth=4       " set shiftwidth as 4
set cursorline         " hightline current line

"set statusline=%<[%{ALEGetStatusLine()}]%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P    " standard status line

set ignorecase         " ignore search case
set smartcase          " use case when has upper char in patten
set hlsearch           " hightlight search
let g:rainbow_active = 1
" }}}

" {{{ Copyright Setting

let g:file_copyright_name = "Eskimo"
let g:file_copyright_email = "zhangfaninner@163.com"
let g:file_copyright_auto_filetypes = ['sh', 'plx', 'pl', 'pm', 'py', 'python', 'h', 'hpp', 'c', 'cpp', 'java']

"}}}

"{{{ vim-indent
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 129
"}}}

