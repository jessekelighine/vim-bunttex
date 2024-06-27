" tex.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:current_syntax") | finish | endif

syntax keyword TexTODO            TODO NOTE FIXME contained
syntax match   TexCommand         /\\\{1,2}/
syntax match   TexCommand         /\\[a-zA-Z]\+/ contains=@NoSpell
syntax match   TexAnd             /&/
syntax match   TexTagItem         /\\\(item\|tag\)\>/
syntax match   TexLR              /\\\(left\|right\|middle\)\>/ contains=@NoSpell
syntax match   TexLR              /\\\(big\|Big\|Bigg\)[lr]\?\>/ contains=@NoSpell
syntax match   TexFoot            /\\\(footnote\(mark\|text\)\{0,1}\|sidenote\)\>/ contains=@NoSpell
syntax match   TexSection         /\\\(sub\)\{0,2}\(section\|paragraph\|chapter\)\>/ contains=@NoSpell
syntax match   TexSection         /\\appendix\>/
syntax match   TexComment         /%.*/  contains=@NoSpell,TexTODO
syntax match   TexTodoComment     /%%.*/ contains=TexTODO
syntax match   TexTodoComment     /%!.*/ contains=TexTODO
syntax match   TexIgnore          /\\\(%\|{\|}\|\$\|#\|&\|!\|\^\|,\|;\|:\|`\|'\|\"\|_\|=\||\|\[\|\]\|\~\)/
syntax match   TexPreambleFirst   /\\\<\(NeedsTeXFormat\|documentclass\|ProvidesPackage\)\>/ contains=@NoSpell
syntax match   TexPreambleCommand /\\\<\(usepackage\|newcommand\|renewcommand\)\>/           contains=@NoSpell
syntax region  TexParen           start="{"  end="}" transparent contains=TOP
syntax match   TexArguments       /#\d\>/
syntax match   TexBeginEndHead    /\\\(begin\|end\)\>/ containedin=TexEnvironment
syntax match   TexEnv             /{\zs[a-zA-Z]\+\ze\*\{0,1}}/ containedin=TexEnvironment
syntax region  TexEnvironment     start="\\\(begin\|end\){" end="}" contains=TexDocEnv,TexEnv,TexEnvEmph,TexBeginEndHead
syntax region  TexMaths           matchgroup=TexDollar start="\$" end="\$" contains=@NoSpell,TexCommand,TexIgnore,TexLR,TexAlgorithm
syntax region  TexCommandWithPath start="\\includegraphics\(\[.\+\]\)\?{" end="}" contains=@NoSpell,TexCommand
syntax region  TexCommandWithPath start="\\input{" end="}" contains=@NoSpell,TexCommand
syntax match   TexVerbatim        /\\[Vv]erb\(.\).\{-}\1/ contains=@NoSpell,TexCommand

let s:TexRefCite_commands = join([
			\ 'label','refeq','refer','url','hyperlink',
			\ '\(page\|eq\|fig\|tab\|name\|h\|hyper\|auto\)\?ref',
			\ 'cite\(list\|field\|name\)','\(paren\|text\|foot\)\?cite'
			\ ],
			\ '\|')
execute 'syntax match  TexRefCite          "\\\(' .. s:TexRefCite_commands .. '\)\>" contains=@NoSpell containedin=TexRefCiteEnv'
execute 'syntax region TexRefCiteEnv start="\\\(' .. s:TexRefCite_commands .. '\)\(\[[^\[\]]\+\]\)\?{" end="}" contains=@NoSpell,TexRefCite'

highlight TexLR ctermfg=238 guifg=#444444

highlight def link TexCommand         Macro
highlight def link TexComment         Comment
highlight def link TexDollar          SpecialComment
highlight def link TexAnd             Tag
highlight def link TexBeginEndHead    Keyword
highlight def link TexTagItem         Debug
highlight def link TexFoot            Keyword
highlight def link TexRefCite         Label
highlight def link TexSection         Type
highlight def link TexTODO            Debug
highlight def link TexTodoComment     Todo
highlight def link TexIgnore          SpecialChar
highlight def link TexPreambleFirst   StorageClass
highlight def link TexPreambleCommand Function
highlight def link TexArguments       SpecialChar
highlight def link TexEnv             Identifier
highlight def link TexEnvEmph         Number

let b:current_syntax = "tex"
