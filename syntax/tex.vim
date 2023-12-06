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
syntax region  TexEnvironment     start="\\\(begin\|end\){" end="}" contains=TexBeginEnd,TexDocEnv,TexEnv
syntax region  TexMaths           matchgroup=TexDollar start="\$" end="\$" contains=@NoSpell,TexCommand,TexIgnore,TexLR
syntax region  TexIncludeGraphics start="\\includegraphics\(\[[^\[\]]\+\]\)\?{" end="}" contains=@NoSpell,TexCommand

let s:cmds = join(['label','refeq','refer','url','hyperlink',
			\ '\(page\|eq\|fig\|tab\|name\|h\|hyper\|auto\)\?ref',
			\ 'cite\(list\|field\|name\)','\(paren\|text\|foot\)\?cite'],'\|')
execute 'syntax match  TexRefCite          "\\\('.s:cmds.'\)\>" contains=@NoSpell'
execute 'syntax region TexRefCiteEnv start="\\\('.s:cmds.'\)\(\[[^\[\]]\+\]\)\?{" end="}" contains=@NoSpell,TexRefCite'

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
