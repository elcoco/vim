call plug#begin('~/.vim/plugged')
if executable('node')
    " COC auto complete and linting
    " To install python plugin run: :CocInstall coc-pyright
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" auto install latest fzf binary
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy find stuff
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/taglist.vim' " needs ctags installed
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'elcoco/writemode.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'
Plug 'francoiscabrol/ranger.vim'
Plug 'ap/vim-css-color'

" Snippets!
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug '~/.vim/plugged/test'
call plug#end()

set nocompatible

" Platform specific settings
if has('unix')
    set directory=~/.vim/tmp/swap            " keep all .swp files in one place
    set viminfo+='1000,n~/.vim/tmp/viminfo   " save vim state
    let g:netrw_home='~/.vim/tmp'            " keep netrwhist file in tmp dir
    set guifont=TerminessTTF\ Nerd\ Font\ 16
else
    set guifont=Consolas:h10:cANSI
endif

set encoding=utf8

" hopefully helps against stupid syntax color problems when quotes are not closed
syntax sync maxlines=1

" COC auto completion
set updatetime=300                          " update faster than default 4s = 4000ms
let b:coc_suggest_disable=1                 " turn off auto suggestions
inoremap <silent><expr> <C-o> coc#refresh() " Use <c-o> to trigger completion.

" FZF
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" RIPGREP, Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" ULTISNIPS, snippets config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"              " list all snippets for current filetype
let g:UltiSnipsEditSplit="vertical"              " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" vim instant markdown plugin
filetype plugin on
let g:instant_markdown_autostart = 1
let g:instant_markdown_browser = "firefox --new-window"

" vim/ipython integration
let g:ipy_monitor_subchannel = 0

" Airline plugin
let g:airline_powerline_fonts = 1
let airline_theme = 'angr'
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

set noshowmode                                   " disable the mode status line (in favour of airline)"
set laststatus=2
" set showtabline=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

nnoremap <C-a> :w<CR>:!sk -l ; arduino --upload % ; sk -u<CR>

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

"map <C-,> <C-W><<CR>            " resize window to left
"map <C-.> <C-W>><CR>            " resize window to right

" auto close brackets and quotes
inoremap (( ()<C-c>i
inoremap [[ []<C-c>i
inoremap {{ {}<C-c>i
inoremap "" ""<C-c>i
inoremap '' ''<C-c>i

" remap the end and home keys as they somehow do something else by default
map [8~ <end>
map [7~ <home>

set splitright                      " create new splits on the right side by default
set number                          " line numbers
set signcolumn=number               " merge signcolumn and line number together
set nowrap

syntax enable
colorscheme eco

set showmatch
set mouse=a                         " Enable mouse support in console

" Only works with vim-gtk or vim-gnome
set clipboard=unnamedplus           " sync vim register with X11 clipboard (+)

set scrolloff=10               " keep at least n lines above/below
set sidescrolloff=5           " keep at least n lines left/right
set scroll=5                   " Smooth srolling

" Taglist plugin
filetype on
let Tlist_Close_On_Select = 1 "close taglist window once we selected something
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
let Tlist_Show_Menu = 1 "show Tags menu in gvim
let Tlist_Show_One_File = 1 "show tags of only one file
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
"let Tlist_Display_Prototype = 1 "display full prototype instead of just function name
"let Tlist_Ctags_Cmd = /path/to/exuberant/ctags
"nnoremap <silent> <Tab> :TlistToggle<CR>
"
" NERDTree plugin
nnoremap <silent> <Tab> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1

" Buffers
set hidden      " Allow switching of buffers when changes have not been saved yet

" Tab options
set tabstop=4       " set tab width to 4 spaces
set softtabstop=4   " see spaces as tabs (delete 4 spaces at once as if it was a tab)
set shiftwidth=4    " use < and > to tab blocks of code
set expandtab       " use spaces instead of tab character
set cindent
set cinkeys-=0#
set indentkeys-=0#

" While searching, press <ENTER> to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>
set hlsearch         " highlight all matches
set incsearch        " incremental search

" Codefolding options
set foldnestmax=2           " fold only 2 levels (only fold classes and defs)
nnoremap <space> za         " toggle fold with spacebar
vnoremap <space> zf
au Syntax * set foldmethod=indent   " set identation on all code files

" Python comments fix
vmap # :s/^/#<CR>

" Correct typing errors
command WQ wq
command Wq wq
command W w
command Q q

" Remember position in file
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Syntax highlighting for nginx
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

" Flag unnecessary whitespace
"au BufRead,BufNewFile * match badwhitespace /\s\+$/

" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Highlight .conf files
:autocmd BufRead,BufNewFile *.conf setf dosini

" 2 spaces in yml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" python specific stuff
syn region Comment start=/"""/ end=/"""/

" hightlight checkboxes, dash and stuff
hi checkbox_checked ctermfg=green
hi checkbox         ctermfg=red
hi option           ctermfg=blue
hi header1          ctermfg=magenta
hi header2          ctermfg=blue
hi header3          ctermfg=white
hi arrow            ctermfg=blue
hi ipaddr           ctermfg=green
hi url              ctermfg=green
hi email            ctermfg=green
hi edit             ctermfg=magenta
hi badwhitespace    ctermbg=darkgray

" Custom syntax highlighting 
syn match checkbox_checked  /^ *\[x\] /
syn match checkbox          /^ *\[ \] /
syn match header1           /^ *===.*/
syn match header3           /^ *-.*/
syn match header2           /^ *--.*/
syn match option            /^ *\$/
syn match arrow             /=> /
syn match edit              /^ *edit: /
syn match arrow             /\-> /
syn match ipaddr            /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
syn match url               /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
syn match email             /\S\+@\S\+/


hi todo         cterm=bold         ctermfg=blue    ctermbg=235
hi done         cterm=bold         ctermfg=green   ctermbg=235
hi note         cterm=bold         ctermfg=magenta ctermbg=235
hi bug          cterm=bold         ctermfg=red     ctermbg=235

call matchadd('todo', 'TODO')
call matchadd('done', 'DONE')
call matchadd('note', 'NOTE')
call matchadd('bug',  'BUG')

hi pythonDecorator  ctermfg=darkgray     ctermbg=235
hi pythonDottedName ctermfg=darkgray     ctermbg=235
hi pythonDot        ctermfg=darkgray     ctermbg=235
" 
syn match  pythonDecorator   "@" display nextgroup=pythonDottedName skipwhite
syn match  pythonDottedName  "[a-zA-Z_][a-zA-Z0-9_]*\(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
syn match  pythonDot         "\." display containedin=pythonDottedName

" column before the linenumber
highlight SignColumn ctermbg=NONE
