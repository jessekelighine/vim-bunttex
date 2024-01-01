" tikz.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax match TikzNumber /[-]\{0,1}\([0-9]*\.\)\{0,1}[0-9]\+\(cm\|mm\|em\|ex\|pt\|in\)*\>/
syntax match TikzDraw /\<\(node\|coordinates*\|cycle\|rectangle\|grid\|circle\|ellipse\|pic\|arc\|to\|plot\|edge\)\>/
syntax match TikzDraw /\(--\||-\|-|\|\.\.\.\|\.\.\)/
syntax match TikzCommands /\<\(at\|controls\|and\|intersections*\)\>/
syntax match TikzTree /\<\(child\|parent\)\>/
syntax match TikzCalc /\((\$\|\$)\)/
syntax match TikzLetIn /\<\(let\|in\)\>/
syntax match TikzLabel /\<label\>/ contained containedin=TikzOption
syntax match TikzDirection /\<\(above\|below\|left\|right\)\>/ contained containedin=TikzOption
syntax match TikzSeparator /\(,\|=\)/ contained containedin=TikzOption
syntax region TikzOption start='\[' end='\]' contains=TikzSeparator,TikzDirection,TikzLabel,TikzNumber,TexSubMaths,TexCommand,TexMaths

syntax match TexEnv "{\zs\(tikzpicture\|scope\)\ze}" contained

highlight def link TikzNumber    Blue
highlight def link TikzLabel     Purple
highlight def link TikzDirection Grey
highlight def link TikzLetIn     Blue
highlight def link TikzDraw      Orange
highlight def link TikzCommands  Yellow
highlight def link TikzTree      Yellow
highlight def link TikzCalc      Yellow
highlight TikzSeparator ctermfg=255 guifg=#FFFFFF cterm=bold gui=bold
