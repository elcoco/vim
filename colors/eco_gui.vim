hi clear
if exists("syntax on")
    syntax reset
endif
let g:colors_name = "eco.vim"

set antialias

" set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

hi Normal                            guifg=#DDDDDD  guibg=#2E2E2E
hi Comment                           guifg=#888888               
hi Constant                          guifg=#FF8278               
hi Operator      gui=bold            guifg=#A6E22E               
hi Statement     gui=bold            guifg=#77BEE0               
hi Directory                         guifg=#77BEE0               
hi ErrorMsg      gui=bold            guifg=#FF8278  guibg=#444444
hi NonText                           guifg=#888888               
hi SpecialKey                        guifg=#888888               
hi LineNr                            guifg=#888888               
hi IncSearch     gui=reverse                                     
hi Search                            guifg=#444444  guibg=#EADC84
hi Visual        gui=bold            guifg=#DDDDDD  guibg=#888888
hi VisualNOS     gui=bold,underline                              
hi MoreMsg                           guifg=#A6E22E               
hi ModeMsg       gui=bold                                        
hi Question                          guifg=#A6E22E               
hi WarningMsg                        guifg=#FF8278               
hi WildMenu                          guifg=#444444  guibg=#EADC84
hi Folded                            guifg=#CCCCCC  guibg=#444444
hi FoldColumn                        guifg=#77BEE0  guibg=#DDDDDD
hi DiffAdd                                          guibg=#77BEE0
hi DiffChange                                       guibg=#DD91F3
hi DiffDelete    gui=bold            guifg=#77BEE0  guibg=#9999CC
hi DiffText      gui=bold                           guibg=#FF8278
hi StatusLine                        guifg=#DDDDDD  guibg=NONE   
hi StatusLineNC                      guifg=#DDDDDD  guibg=NONE   
hi VertSplit     gui=bold            guifg=#888888  guibg=NONE   
hi Title                             guifg=#DD91F3               
hi Pmenu                             guifg=#DDDDDD  guibg=#444444
hi PmenuSel      gui=bold            guifg=#DDDDDD  guibg=#888888
hi PreProc                           guifg=#77BEE0               
hi Type                              guifg=#A6E22E               
hi Identifier                        guifg=#A6E22E               
hi Ignore                            guifg=#888888               
hi Error         gui=bold            guifg=#FF8278  guibg=#444444
hi Todo          gui=bold            guifg=#444444  guibg=#EADC84
hi Underlined    gui=underline       guifg=#77BEE0               
hi Self                              guifg=#888888               
hi Number                            guifg=#FF8278               
hi String                            guifg=#FF8278               
hi Character                         guifg=#FF8278               
hi Number                            guifg=#FF8278               
hi Boolean                           guifg=#FF8278               
hi Float                             guifg=#FF8278               
hi Function      gui=bold            guifg=#A6E22E               
hi Conditional   gui=bold            guifg=#77BEE0               
hi Repeat        gui=bold            guifg=#77BEE0               
hi Label                             guifg=#77BEE0               
hi Keyword                           guifg=#77BEE0               
hi Exception     gui=bold            guifg=#77BEE0               
hi Include       gui=bold            guifg=#77BEE0               
hi Define                            guifg=#77BEE0               
hi Macro                             guifg=#77BEE0               
hi PreCondit                         guifg=#77BEE0               
hi StorageClass                      guifg=#A6E22E               
hi Structure     gui=bold            guifg=#A6E22E               
hi Typedef       gui=bold            guifg=#A6E22E               
