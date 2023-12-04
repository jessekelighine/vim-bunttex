" tikz.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax match TikzOptNum "[-]\{0,1}\([0-9]*\.\)\{0,1}[0-9]\+\(cm\|mm\|em\|ex\|pt\|in\)*\>"
syntax match TikzDraw   "\<\(node\|coordinates*\|cycle\|rectangle\|grid\|circle\|ellipse\|pic\|arc\|to\|plot\|edge\)\>"
syntax match TikzDraw   "\(--\||-\|-|\|\.\.\.\|\.\.\)"
syntax match TikzLabel  "\<label\>" contained
syntax match TikzOptDir "\<\(above\|below\|left\|right\)\>" contained
syntax match TikzOption "\(,\|=\)" contained
syntax match TikzYellow "\<\(child\|at\|controls\|and\|intersections*\|parent\)\>"
syntax match TikzYellow "\((\$\|\$)\)"
syntax match TikzBlue   "\<\(let\|in\)\>"
syntax region TikzOptionRegion start='\[' end='\]' contains=TikzOption,TikzOptDir,TikzLabel,TexSubMaths,TikzOptNum,TexCommand,TexMaths

syntax match TikzPicEnv "{\zs\(tikzpicture\|scope\)\ze}" contained

highlight def link TikzOptNum Blue
highlight def link TikzLabel  Purple
highlight def link TikzOptDir Grey
highlight def link TikzBlue   Blue
highlight def link TikzDraw   Orange
highlight def link TikzYellow Yellow
highlight TikzOption ctermfg=255 cterm=bold gui=bold

highlight def link TikzPicEnv Blue
