call plug#begin('~/.vim/plugged')
if executable('node')
    " COC auto completion and linting
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " COC extensions
    " to run post install hooks, yarn must be installed: sudo npm install --global yarn
    Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-json',       {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-snippets',   {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-yaml',       {'do': 'yarn install --frozen-lockfile'}
    Plug 'weirongxu/coc-calc',      {'do': 'yarn install --frozen-lockfile'}
endif

" auto installs latest FZF binary
" if bat is installed, previews are syntax highlighted
" if ripgrep is installed, we can grep through files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy find stuff
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/taglist.vim' " needs ctags installed
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'elcoco/writemode.vim'
"
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'
Plug 'francoiscabrol/ranger.vim'
Plug 'ap/vim-css-color'

" Snippets!
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Checkbox
Plug 'jkramer/vim-checkbox'

Plug '~/.vim/plugged/test'
call plug#end()

set nocompatible        " use VIM settings instead of VI settings

" platform specific settings
if has('unix')
    set directory=~/.vim/tmp/swap            " keep all .swp files in one place
    set viminfo+='1000,n~/.vim/tmp/viminfo   " save vim state
    let g:netrw_home='~/.vim/tmp'            " keep netrwhist file in tmp dir
endif

set encoding=utf8
set splitbelow splitright           " create new splits on the right side by default
set number                          " line numbers
set signcolumn=number               " merge signcolumn and line number together
set nowrap                          " don't wrap lines
set hidden                          " Allow switching of buffers when changes have not been saved yet
set showmatch                       " Highlight matching brace
set mouse=a                         " Enable mouse support in console
set clipboard=unnamedplus           " sync vim register with X11 clipboard (+)
set scrolloff=10                    " keep at least n lines above/below
set sidescrolloff=5                 " keep at least n lines left/right
set scroll=5                        " Smooth srolling
vnoremap . :normal .<CR>            " perform dot commands over visual block

" tab options
set tabstop=4       " set tab width to 4 spaces
set softtabstop=4   " see spaces as tabs (delete 4 spaces at once as if it was a tab)
set shiftwidth=4    " use < and > to tab blocks of code
set expandtab       " use spaces instead of tab character
set cindent
set cinkeys-=0#
set indentkeys-=0#
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab    " 2 spaces in yml files

" while searching, press <ENTER> to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>
set hlsearch         " highlight all matches
set incsearch        " incremental search

" Codefolding options
set foldmethod=indent               " fold at indented text
set foldnestmax=2                   " fold only 2 levels (only fold classes and defs)
nnoremap <space> za                 " toggle fold with spacebar
vnoremap <space> zf

function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return '▶ '. foldedlinecount . line
endfunction

set foldtext=MyFoldText()
set fillchars=fold:\ 

" BUFFERS and SPLITS
nnoremap <C-n> :enew<cr>            " new buffer
nnoremap <C-j> :bprevious<CR>       " previous buffer"
nnoremap <C-k> :bnext<CR>           " next buffer"
nnoremap <C-x> :bp <BAR> bd #<CR>   " close buffer and move to previous one"
nnoremap <C-\> :vsp <CR>            " create vertical split"
nnoremap <C-S>- :sp <CR>            " create vertical split"
nnoremap <C-h> <C-W>W<CR>           " move to previous window
nnoremap <C-l> <C-W>w<CR>           " move to next window
autocmd VimResized * wincmd =       " autoresize splits to equal proportions on window resize
"map <C-,> <C-W><<CR>               " resize window to left
"map <C-.> <C-W>><CR>               " resize window to right

" auto close brackets and quotes
inoremap (( ()<C-c>i
inoremap [[ []<C-c>i
inoremap {{ {}<C-c>i
inoremap "" ""<C-c>i
inoremap '' ''<C-c>i

" remap the end and home keys as they somehow do something else by default
map [8~ <end>
map [7~ <home>

" python comments fix
vmap # :s/^/#<CR>

" correct typing errors
command WQ wq
command Wq wq
command W w
command Q q

" save file with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" upload file to MCU
nnoremap    <C-a> :w<CR>:!sk -l ; arduino --upload % ; sk -u<CR>

" remember position in file
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" highlight unnecessary whitespace
"au BufRead,BufNewFile * match badwhitespace /\s\+$/

" highlight .conf files
:autocmd BufRead,BufNewFile *.conf setf dosini

"syntax enable
"syntax sync maxlines=1      " hopefully helps against stjupid syntax color problems when quotes are not closed
colorscheme eco

" syntax highlighting for nginx
au BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufRead,BufNewFile .zshrc set syntax=sh



"" C specific, uses custom syntax file
" TODO function definition and calling is same color
"      and very difficult to parse otherwise
hi cFunction       cterm=bold   ctermfg=green
hi cFunctionCall   cterm=None   ctermfg=gray
hi cMemberAccess   cterm=None   ctermfg=white

hi cLabel          cterm=bold   ctermfg=blue
hi cStatement      cterm=bold   ctermfg=blue
hi cConditional    cterm=bold   ctermfg=blue
hi cDefine         cterm=none   ctermfg=blue
hi cInclude        cterm=none   ctermfg=blue
hi cMacro          cterm=bold   ctermfg=blue

hi cTypedef        cterm=bold   ctermfg=green
hi cStructure      cterm=None   ctermfg=green

hi cType                        ctermfg=blue
hi cUserType                    ctermfg=blue
hi cPosixType                   ctermfg=blue

hi cBraces                      ctermfg=gray
hi cCondOperator                ctermfg=blue

hi cTodo                        ctermfg=blue        
hi cDone                        ctermfg=green       
hi cNote                        ctermfg=magenta     
hi cBug                         ctermfg=red         

hi cDot           cterm=bold    ctermfg=gray

hi cOperator                    ctermfg=green         

" end C specific



"" hightlight checkboxes, dash and stuff
"hi checkbox_checked               ctermfg=green
"hi checkbox                       ctermfg=red
"hi option                         ctermfg=blue
"hi header1                        ctermfg=magenta
"hi header2                        ctermfg=blue
"hi header3                        ctermfg=white
"hi arrow                          ctermfg=blue
"hi ipaddr                         ctermfg=green
"hi url                            ctermfg=green
"hi email                          ctermfg=green
"hi edit                           ctermfg=magenta
"hi badwhitespace                  ctermbg=darkgray
"
"hi todo               cterm=bold  ctermfg=blue        ctermbg=None
"hi done               cterm=bold  ctermfg=green       ctermbg=None
"hi note               cterm=bold  ctermfg=magenta     ctermbg=None
"hi bug                cterm=bold  ctermfg=red         ctermbg=None
"
"hi pythonDecorator                ctermfg=darkgray    ctermbg=235
"hi pythonDottedName               ctermfg=darkgray    ctermbg=235
"hi pythonDot                      ctermfg=darkgray    ctermbg=235
"
"" column before the linenumber
"hi SignColumn                                         ctermbg=NONE
"
"syn match checkbox_checked  /^ *\[x\] /
"syn match checkbox          /^ *\[ \] /
"syn match header1           /^ *===.*/
"syn match header3           /^ *-.*/
"syn match header2           /^ *--.*/
"syn match option            /^ *\$/
"syn match arrow             /=> /
"syn match edit              /^ *edit: /
"syn match arrow             /\-> /
"syn match ipaddr            /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
"syn match url               /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
"syn match email             /\S\+@\S\+/
"
"syn match todo              'TODO'
"syn match done              'DONE'
"syn match note              'NOTE'
"syn match bug               'BUG'
"
"syn match pythonDecorator   "@" display nextgroup=pythonDottedName skipwhite
"syn match pythonDottedName  "[a-zA-Z_][a-zA-Z0-9_]*\(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
"syn match pythonDot         "\." display containedin=pythonDottedName
