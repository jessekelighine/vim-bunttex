" tex.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:current_syntax") | finish | endif

syntax keyword TexTODO               TODO contained
syntax match   TexCommand            "\\\{1,2}"
syntax match   TexCommand            "\\[a-zA-Z]\+" contains=@NoSpell
syntax match   TexAnd                "&"
syntax match   TexBeginEnd           "\\\(begin\|end\)\>" contained
syntax match   TexTagItem            "\\\(item\|tag\)\>"
syntax match   TexSubRef             "\\\(label\|ref\|pageref\|eqref\)\>"            contains=@NoSpell
syntax match   TexSubRef             "\\\(refeq\|refer\|figref\|tabref\|nameref\)\>" contains=@NoSpell
syntax match   TexSubRef             "\\\(href\|url\|href\|hyperref\|hyperlink\)\>"  contains=@NoSpell
syntax match   TexSubCite            "\\\(parencite\|citelist\|textcite\|citefield\|citename\|footcite\|cite\)\>" contains=@NoSpell
syntax match   TexSubLR              "\\\(left\|right\|big\|Big\|middle\|Bigg\)\>" contains=@NoSpell
syntax match   TexSubFoot            "\\\(footnotemark\|footnote\|sidenote\)\>" contains=@NoSpell
syntax match   TexSection            "\\\(sub\)\{0,2}\(section\|paragraph\|chapter\)\>" contains=@NoSpell
syntax match   TexSection            "\\appendix\>"
syntax match   TexComment            "%.*"  contains=@NoSpell,TexTODO
syntax match   TexSubTodo            "%%.*" contains=TexTODO
syntax match   TexIgnore             "\\\(%\|{\|}\|\$\|#\|&\|!\|\^\|,\|;\|:\|`\|'\|\"\|_\|=\||\|\[\|\]\|\~\)"
syntax match   TexSubPreambleFirst   "\\\<\(NeedsTeXFormat\|documentclass\|ProvidesPackage\)\>" contains=@NoSpell
syntax match   TexSubPreambleCommand "\\\<\(usepackage\|newcommand\|renewcommand\)\>"           contains=@NoSpell
syntax match   TexSubArguments       "#\d\>"
syntax region  TexMaths              matchgroup=TexDollar start="\$" end="\$"          contains=@NoSpell,TexSubRef,TexCommand,TexIgnore,TexSubLR
syntax region  TexSubRefEnviron      start="\\\(label\|ref\|pageref\|eqref\){" end="}" contains=@NoSpell,TexSubRef
syntax region  TexEnviron            start="\\\(begin\|end\){" end="}"                 contains=TexBeginEnd,TexDocEnv,TikzPicEnv,BeamerEnv,AmsthmEnv,TexFigEnv

highlight def link TexCommand            Green
highlight def link TexComment            Comment
highlight def link TexDollar             Grey
highlight def link TexAnd                Orange
highlight def link TexBeginEnd           Yellow
highlight def link TexTagItem            Yellow
highlight def link TexSubFoot            Orange
highlight def link TexSubRef             Orange
highlight def link TexSubCite            Orange
highlight def link TexSection            Type
highlight          TexSubLR              ctermfg=240 guifg=#666666
highlight def link TexTODO               Debug
highlight def link TexSubTodo            Todo
highlight def link TexIgnore             Yellow
highlight def link TexSubPreambleFirst   StorageClass
highlight def link TexSubPreambleCommand Function
highlight def link TexSubArguments       SpecialChar

let b:current_syntax="tex"
