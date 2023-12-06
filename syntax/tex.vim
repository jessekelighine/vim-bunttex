" tex.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:current_syntax") | finish | endif

syntax keyword TexTODO            TODO contained
syntax match   TexCommand         "\\\{1,2}"
syntax match   TexCommand         "\\[a-zA-Z]\+" contains=@NoSpell
syntax match   TexAnd             "&"
syntax match   TexBeginEnd        "\\\(begin\|end\)\>" contained
syntax match   TexTagItem         "\\\(item\|tag\)\>"
syntax match   TexLR              "\\\(left\|right\|big\|Big\|middle\|Bigg\)\>" contains=@NoSpell
syntax match   TexFoot            "\\\(footnotemark\|footnote\|sidenote\)\>" contains=@NoSpell
syntax match   TexSection         "\\\(sub\)\{0,2}\(section\|paragraph\|chapter\)\>" contains=@NoSpell
syntax match   TexSection         "\\appendix\>"
syntax match   TexComment         "%.*"  contains=@NoSpell,TexTODO
syntax match   TexTodoComment     "%%.*" contains=TexTODO
syntax match   TexIgnore          "\\\(%\|{\|}\|\$\|#\|&\|!\|\^\|,\|;\|:\|`\|'\|\"\|_\|=\||\|\[\|\]\|\~\)"
syntax match   TexPreambleFirst   "\\\<\(NeedsTeXFormat\|documentclass\|ProvidesPackage\)\>" contains=@NoSpell
syntax match   TexPreambleCommand "\\\<\(usepackage\|newcommand\|renewcommand\)\>"           contains=@NoSpell
syntax match   TexArguments       "#\d\>"
syntax region  TexEnvironment     start="\\\(begin\|end\){" end="}"        contains=TexBeginEnd,TexDocEnv,TexEnv
syntax region  TexMaths           matchgroup=TexDollar start="\$" end="\$" contains=@NoSpell,TexCommand,TexIgnore,TexLR
syntax match   TexRefCite         "\\\(label\|refeq\|refer\|url\|hyperlink\)\>"     contains=@NoSpell
syntax match   TexRefCite         "\\\(page\|eq\|fig\|tab\|name\|h\|hyper\)\?ref\>" contains=@NoSpell
syntax match   TexRefCite         "\\cite\(list\|field\|name\)\>"                   contains=@NoSpell
syntax match   TexRefCite         "\\\(paren\|text\|foot\)\?cite\>"                 contains=@NoSpell
syntax region  TexRefCiteEnv      start="\\\(label\|refeq\|refer\|url\|hyperlink\)\>{"     end="}" contains=@NoSpell,TexRefCite
syntax region  TexRefCiteEnv      start="\\\(page\|eq\|fig\|tab\|name\|h\|hyper\)\?ref\>{" end="}" contains=@NoSpell,TexRefCite
syntax region  TexRefCiteEnv      start="\\cite\(list\|field\|name\)\>{"                   end="}" contains=@NoSpell,TexRefCite
syntax region  TexRefCiteEnv      start="\\\(paren\|text\|foot\)\?cite\>{"                 end="}" contains=@NoSpell,TexRefCite

highlight def link TexCommand         Green
highlight def link TexComment         Comment
highlight def link TexDollar          Grey
highlight def link TexAnd             Orange
highlight def link TexBeginEnd        Yellow
highlight def link TexTagItem         Yellow
highlight def link TexFoot            Orange
highlight def link TexRefCite         Orange
highlight def link TexSection         Type
highlight          TexLR              ctermfg=240 guifg=#666666
highlight def link TexTODO            Debug
highlight def link TexTodoComment     Todo
highlight def link TexIgnore          Yellow
highlight def link TexPreambleFirst   StorageClass
highlight def link TexPreambleCommand Function
highlight def link TexArguments       SpecialChar
highlight def link TexEnv             Blue

let b:current_syntax="tex"
