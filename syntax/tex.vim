" tex.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Jesse C. Chen (jessekelighine on Github)                            "
" Repo: https:github.com/jessekelighine/vim-bunttex                           "
" License: Distributed under the same terms as Vim. See `:help license`.      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:current_syntax") | finish | endif

syntax keyword TexTODO            TODO contained
syntax match   TexCommand         /\\\{1,2}/
syntax match   TexCommand         /\\[a-zA-Z]\+/ contains=@NoSpell
syntax match   TexAnd             /&/
syntax match   TexTagItem         /\\\(item\|tag\)\>/
syntax match   TexLR              /\\\(left\|right\|big\|Big\|middle\|Bigg\)\>/ contains=@NoSpell conceal cchar=→
syntax match   TexFoot            /\\\(footnotemark\|footnote\|sidenote\)\>/ contains=@NoSpell
syntax match   TexSection         /\\\(sub\)\{0,2}\(section\|paragraph\|chapter\)\>/ contains=@NoSpell
syntax match   TexSection         /\\appendix\>/
syntax match   TexComment         /%.*/  contains=@NoSpell,TexTODO
syntax match   TexTodoComment     /%%.*/ contains=TexTODO
syntax match   TexIgnore          /\\\(%\|{\|}\|\$\|#\|&\|!\|\^\|,\|;\|:\|`\|'\|\"\|_\|=\||\|\[\|\]\|\~\)/
syntax match   TexPreambleFirst   /\\\<\(NeedsTeXFormat\|documentclass\|ProvidesPackage\)\>/ contains=@NoSpell
syntax match   TexPreambleCommand /\\\<\(usepackage\|newcommand\|renewcommand\)\>/           contains=@NoSpell
syntax match   TexArguments       /#\d\>/
syntax match   TexBeginEndHead    /\\\(begin\|end\)\>/ contained
syntax region  TexEnvironment     start="\\\(begin\|end\){" end="}" contains=TexDocEnv,TexEnv,TexBeginEndHead
syntax region  TexMaths           matchgroup=TexDollar start="\$" end="\$" contains=@NoSpell,TexCommand,TexIgnore,TexLR,TexAlgorithm
syntax region  TexCommandWithPath start="\\includegraphics\(\[.\+\]\)\?{" end="}" contains=@NoSpell,TexCommand
syntax region  TexCommandWithPath start="\\input{" end="}" contains=@NoSpell,TexCommand

let s:TexRefCite_commands = join([
			\ 'label','refeq','refer','url','hyperlink',
			\ '\(page\|eq\|fig\|tab\|name\|h\|hyper\|auto\)\?ref',
			\ 'cite\(list\|field\|name\)','\(paren\|text\|foot\)\?cite'],'\|')
execute 'syntax match  TexRefCite          "\\\(' .. s:TexRefCite_commands .. '\)\>" contains=@NoSpell containedin=TexRefCiteEnv'
execute 'syntax region TexRefCiteEnv start="\\\(' .. s:TexRefCite_commands .. '\)\(\[[^\[\]]\+\]\)\?{" end="}" contains=@NoSpell,TexRefCite'

highlight def link TexCommand      Macro
highlight def link TexComment      Comment
highlight def link TexDollar       SpecialComment
highlight def link TexAnd          Tag
highlight def link TexBeginEndHead Keyword
highlight def link TexTagItem      Debug
highlight def link TexFoot         Label
highlight def link TexRefCite      Label
highlight def link TexSection      Type

let s:TexLR_colors = { "256":"238", "hex":"#444444" }
execute "highlight TexLR   ctermfg=" .. s:TexLR_colors["256"] .. " guifg=" .. s:TexLR_colors["hex"]
execute "highlight Conceal ctermfg=" .. s:TexLR_colors["256"] .. " guifg=" .. s:TexLR_colors["hex"]

highlight def link TexTODO            Debug
highlight def link TexTodoComment     Todo
highlight def link TexIgnore          SpecialChar
highlight def link TexPreambleFirst   StorageClass
highlight def link TexPreambleCommand Function
highlight def link TexArguments       SpecialChar
highlight def link TexEnv             Identifier

let b:current_syntax="tex"
