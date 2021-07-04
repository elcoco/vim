
" NERDTree plugin
nnoremap <silent> <Tab> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1

