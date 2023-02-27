" Disable  creating swap files
set noswapfile

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2   

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" utf-8 byte sequence
set encoding=utf-8

set mouse=a

set background=dark

set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" PLUGINS ---------------------------------------------------------------- 

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'santiagovrancovich/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'mhinz/vim-signify'

call plug#end()

" MAPPINGS --------------------------------------------------------------- 
" --------------------------Coc-config-------------------------------

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
hi link CocFloating Normal

autocmd ColorScheme * call Highlight()

function! Highlight() abort
  hi SignifySignAdd    ctermfg=green  guifg=#00ff00 ctermbg=NONE guibg=NONE
  hi SignifySignDelete ctermfg=red    guifg=#ff0000 ctermbg=NONE guibg=NONE
  hi SignifySignChange ctermfg=yellow guifg=#ffff00 ctermbg=NONE guibg=NONE
  hi SignColumn ctermbg=NONE
  hi Conceal ctermfg=239 guifg=#504945 
  hi CocSearch ctermfg=12 guifg=#18A3FF
  hi CocErrorHighlight ctermfg=Red  guifg=#ff0000
  hi CocErrorSign ctermfg=Red guifg=#ff0000 
  hi CocWarningSign ctermfg=Brown guifg=#ff922b
  hi CocInfoSign ctermfg=Yellow guifg=#fab005
  hi CocHintSign ctermfg=White guifg=#ffffff guibg=NONE
  hi default link CocErrorFloat CocErrorSign 
  hi default link CocWarningFloat CocWarningSign 
  hi default link CocInfoFloat CocInfoSign 
  hi default link CocHintFloat CocHintSign 
  hi default link CocHoverRange Search 
  hi default link CocCursorRange Search 
endfunction

let g:molokai_original = 1
autocmd vimenter * ++nested colorscheme molokai 

autocmd ColorScheme * hi CocMenuSel ctermbg=237 guibg=#13354A

set termguicolors

autocmd FileType json syntax match Comment +\/\/.\+$+

" prettier

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument


" ------------------------End-Coc-config--------------------------------

" ------------------------General-config--------------------------------

" signify

"Quit nerdtree
"let NERDTreeQuitOnOpen=1

"Set the backslash as the leader key.
let mapleader = " "

let g:coc_disable_startup_warning = 1

nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bd :bd<CR>

nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

map <Leader>ob :Buffers<cr>
map <Leader>p :Files<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-definition)

" ------------------------Vimscript------------------------------------

" This will enable code folding.
" Use the marker method of folding.

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" -----------------------Status-Line-config----------------------------

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
