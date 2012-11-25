" vim:foldmethod=marker
"
" Roshambo Colorscheme. A work in progress.
"
" By Roshambo
" Created 2010-11-04 11:36 EDT
" In New York, New York, United States
"


" Config {{{

highlight clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'Roshambo'

" }}}

" Vim UI {{{

if has('mac')
	set transparency=2
endif

hi Normal         ctermfg=250 ctermbg=0 guifg=#c1c1c1 guibg=#1a1d1e
hi NonText        ctermfg=235 guifg=#3d464e gui=none
hi SpecialKey     guifg=#3d464e gui=none
hi Cursor         guifg=#f1f1f1 guibg=#3b464d
hi ColorColumn    ctermbg=232 guibg=#141716
hi CursorLine     cterm=none ctermbg=233 guibg=#0e1113
hi Visual         guibg=#3b464d
hi ModeMsg        guifg=#798b92 gui=italic
hi LineNr         ctermfg=238 guifg=#556166 guibg=#151A1B gui=none
hi CursorLineNr   ctermfg=242 guifg=#adadad
"hi WildMenu       guibg=#2c302d guifg=#cbecd0 gui=underline
hi PMenu          guifg=#1b313e guibg=#7abfdf
hi PMenuSel       guifg=#FFFF99 guibg=#312B2B
hi PmenuSbar      guifg=#FFFF99 guibg=#7abfdf
hi PmenuThumb     guifg=#174c63
hi VertSplit      guifg=#556166 guibg=#151A1B
hi MatchParen     guibg=#3d7b94
hi SignColumn     guibg=#121518
hi Folded         ctermfg=241 ctermbg=233 guifg=#947D7D guibg=#1A1717
"hi FoldColumn     guifg=#947D7D guibg=#121518
hi Question       guifg=#6bd26f gui=bold
hi Search         guibg=#c4c249
hi Title          guifg=#e75b91
hi Error          guifg=#f0f0f0 guibg=#ff4546
hi ErrorMsg       guifg=#f0f0f0 guibg=#ff4546
hi Todo           guifg=#000000 guibg=#51a156
hi WarningMsg     guifg=#ff3a3f  gui=bold
hi TagListFileName guifg=#B4D0E1 guibg=#495B5F

" }}}

" General {{{

hi Comment        ctermfg=239 guifg=#008e5d gui=italic
hi Operator       ctermfg=160 guifg=#ff5e57
hi String         ctermfg=23 guifg=#798b92
hi Keyword        ctermfg=22 guifg=#ff8ad9
hi Function       ctermfg=31 guifg=#51a4c5
hi Constant       ctermfg=39 guifg=#76d6ff gui=bold
hi Type           ctermfg=24 guifg=#b39967 gui=none
hi Statement      ctermfg=34 guifg=#ff8ad8 gui=none
hi Special        ctermfg=178 guifg=#d8ea9f
hi Identifier     ctermfg=29 guifg=#00c6ff
hi PreProc        ctermfg=33 guifg=#72fcd5 gui=none

" }}}

" Tabs {{{

hi TabLineFill guibg=#343434 guibg=#333D3E gui=none
hi TabLineSel  guifg=#e9e9e9 guibg=#1B2121 gui=none
hi TabLine     guifg=#93C8CE guibg=#47595B gui=none

" }}}

" Statusline {{{
" NOTE: this section now outdated due to the Powerline plugin.

"hi StatusLine                  guifg=#e2eb23 guibg=#2085ad gui=none
"hi StatusLineNC                guifg=#5D7075 guibg=#2C383A gui=none
"au InsertEnter * hi StatusLine guifg=#7a2d2e guibg=#4bbfa1 gui=bold
"au InsertLeave * hi StatusLine guifg=#e2eb23 guibg=#2085ad gui=none

" }}}

" CSS {{{

hi cssComment              guifg=#798b92 gui=none
hi cssImportant            guifg=#ff5e57 gui=bold
hi cssInclude              ctermfg=125 guifg=#46EFFE gui=bold
hi cssBraces               guifg=#e8fcb0
hi cssURL                  ctermfg=191 guifg=#c8de83
hi cssStringQ              ctermfg=185 guifg=#c8de83
hi cssStringQQ             ctermfg=185 guifg=#c8de83
hi cssTagName              ctermfg=161 guifg=#ff5da1
hi cssClassName            ctermfg=206 guifg=#ff8ad8
hi cssIdentifier           guifg=#ff2f93
hi cssPseudoClass          ctermfg=177 guifg=#C563A7
hi cssPseudoClassId        ctermfg=177 guifg=#C563A7
hi cssSelectorOp           ctermfg=167 guifg=#AA5590

hi cssFontProp             ctermfg=37 guifg=#60edc8
hi cssColorProp            ctermfg=37 guifg=#60edc8
hi cssTextProp             ctermfg=37 guifg=#60edc8
hi cssBoxProp              ctermfg=37 guifg=#60edc8
hi cssRenderProp           ctermfg=37 guifg=#60edc8
hi cssAuralProp            ctermfg=37 guifg=#60edc8
hi cssGeneratedContentProp ctermfg=37 guifg=#60edc8
hi cssPagingProp           ctermfg=37 guifg=#60edc8
hi cssTableProp            ctermfg=37 guifg=#60edc8
hi cssUIProp               ctermfg=37 guifg=#60edc8
hi cssMiscProp             ctermfg=37 guifg=#60edc8

hi cssCommonAttr           ctermfg=24 guifg=#51a4c5
hi cssFontAttr             ctermfg=24 guifg=#51a4c5
hi cssTextAttr             ctermfg=24 guifg=#51a4c5
hi cssColorAttr            ctermfg=24 guifg=#51a4c5
hi cssBoxAttr              ctermfg=24 guifg=#51a4c5
hi cssRenderAttr           ctermfg=24 guifg=#51a4c5
hi cssAuralAttr            ctermfg=24 guifg=#51a4c5
hi cssMiscAttr             ctermfg=24 guifg=#51a4c5
hi cssColor                ctermfg=24 guifg=#51a4c5
hi cssInteger              ctermfg=24 guifg=#51a4c5
hi cssValueNumber          ctermfg=24 guifg=#51a4c5 gui=none
hi cssValueInteger         ctermfg=24 guifg=#51a4c5 gui=none
hi cssValueLength          ctermfg=24 guifg=#51a4c5 gui=none
hi cssValueAngle           ctermfg=24 guifg=#51a4c5 gui=none
hi cssValueTime            ctermfg=24 guifg=#51a4c5 gui=none
hi cssValueFrequency       ctermfg=24 guifg=#51a4c5 gui=none

" }}}

" Less {{{

"hi lessDefinition guifg=#7d7d7d
hi lessVariable guifg=#3fced3
hi lessVariableAssignment guifg=#1e9698
hi lessVariableValue guifg=#268f92
hi lessOperator guifg=#e7ffb2
hi lessDefault guifg=#7d7d7d
hi lessOperator guifg=#7d7d7d
hi lessMixinChar guifg=#ff8ad8
hi lessAmpersandChar guifg=#833e63
"hi lessClass guifg=#268f92
hi lessClass guifg=#ff8ad8
hi lessFunction guifg=#2eb5dc
hi lessComment guifg=#798b92

" }}}

" Stylus {{{
hi stylusComment ctermfg=238
hi stylusCssComment ctermfg=238
hi stylusVariable guifg=#3fced3
hi stylusFunction guifg=#2eb5dc
hi stylusComment guifg=#798b92
hi stylusClass ctermfg=206 guifg=#ff8ad8
hi stylusClassChar ctermfg=206 guifg=#ff8ad8
hi stylusId ctermfg=198 guifg=#ff2f93
hi stylusIdChar ctermfg=198 guifg=#ff2f93
hi stylusProperty ctermfg=37
hi stylusFunction ctermfg=42
hi stylusUserFunction ctermfg=42
hi stylusInterpolation ctermfg=42
hi stylusVariable ctermfg=42
hi stylusVariableAssignment ctermfg=30
hi stylusAmpersand ctermfg=89

" }}}

" HTML {{{

hi htmlTag           ctermfg=75 guifg=#3EADFD
hi htmlTagName       ctermfg=75 guifg=#3EADFD
hi htmlArg           ctermfg=87 guifg=#46EFFE
hi htmlString        ctermfg=193 guifg=#D7EDA1
hi htmlSpecialChar   ctermfg=231 guifg=#ffffff gui=bold
hi htmlTitle         ctermfg=250 guifg=#c1c1c1
hi htmlH1            ctermfg=250 guifg=#c1c1c1
hi def link htmlLink Normal
hi htmlDoctype       ctermfg=141 guifg=#af98ff gui=bold
hi htmlBlockTag      ctermfg=204 guifg=#f53d92

" }}}

" PHP {{{

hi phpComment                 guifg=#1D915E gui=italic
hi phpString                  guifg=#7B8B92
hi phpConstant                guifg=#01ecff
hi phpKeyword                 guifg=#03b9ff
hi phpConditional             guifg=#03b9ff
hi phpFunctions               guifg=#4edeb0

" }}}

" JavaScript {{{

hi javaScriptComment          guifg=#209074
hi javaScriptLineComment      guifg=#209074
hi javaScriptSpecial          guifg=#F83E42
hi javaScriptStringS          guifg=#b09b6a
hi javaScriptStringD          guifg=#B09B6A
hi javaScriptSpecialCharacter guifg=#e7ffb2
hi javaScriptConditional      guifg=#FB82D8
hi javaScriptRepeat           guifg=#FB82D8
hi javaScriptBranch           guifg=#FB82D8
hi javaScriptStatement        guifg=#FB82D8
hi javaScriptOperator         guifg=#F83E42
hi javaScriptType             guifg=#41c5fd
hi javaScriptFunction         guifg=#41C5FD
hi javaScriptBraces           guifg=#E7FFB2
hi javaScriptParens           guifg=#e7ffb2
hi javaScriptBoolean          guifg=#85D5FE gui=bold
hi javaScriptNumber           guifg=#85D5FE gui=bold
hi javaScriptNull             guifg=#85D5FE gui=bold
hi javaScriptRegexpString     guifg=#6BD26F
hi javaScriptGlobal           guifg=#84FFD6
hi javaScriptMember           guifg=#84FFD6

hi javaScriptDollarVariable   guifg=#F83E42
hi javaScriptPunctuation      guifg=#e7ffb2
hi javaScriptFunctionName     guifg=#ffffff gui=bold

" }}}

" Coffee-Script {{{
hi coffeeKeyword                ctermfg=77 guifg=#6bd26f
hi coffeeConditional            ctermfg=206 guifg=#ff6fd0
hi coffeeRepeat                 ctermfg=206 guifg=#ff6fd0
hi coffeeException              ctermfg=77 guifg=#6bd26f
hi coffeeStatement              ctermfg=77 guifg=#6bd26f
hi coffeeString                 ctermfg=102 guifg=#7b8b92
hi coffeeRegex                  ctermfg=62 guifg=#6d73ea
hi coffeeEscape                 ctermfg=179 cterm=bold guifg=#c4c249 gui=bold
hi coffeeGlobal                 ctermfg=81 guifg=#41c5fd
hi coffeeBoolean                ctermfg=39 guifg=#00b9ff
hi coffeeAssign                 ctermfg=137 guifg=#b09b6a
hi coffeeAssignSymbols          ctermfg=160 guifg=#f8585b
hi coffeeSpecialVar             ctermfg=80 guifg=#3be8c7
hi coffeeObject                 ctermfg=231 cterm=bold,underline guifg=#ffffff gui=bold,underline
hi coffeeObjAssign              ctermfg=39 guifg=#00b9ff
hi coffeeSpecialIdent           ctermfg=80 guifg=#3dc7cf
hi coffeeComment                ctermfg=29 guifg=#1d915e gui=italic
hi coffeeFunction               ctermfg=67 guifg=#4974ac
hi coffeeOperator               ctermfg=203 guifg=#f8585b
hi coffeeAssignBrackets         ctermfg=193 guifg=#e7ffb2
hi coffeeConstant               ctermfg=81 cterm=bold guifg=#66ccff gui=bold
hi coffeeNumber                 ctermfg=81 cterm=bold guifg=#66ccff gui=bold
hi coffeeFloat                  ctermfg=81 cterm=bold guifg=#66ccff gui=bold
"hi coffeePrototype guifg=#e9e9e9 gui=bold
"hi coffeeDot guifg=#e9e9e9 gui=bold

hi coffeePunctutation           ctermfg=193 guifg=#e7ffb2

" }}}

" Python {{{

"let python_highlight_all = 1

hi pythonComment            ctermfg=29 guifg=#1d915e gui=italic
hi pythonString             ctermfg=102 guifg=#7b8b92
hi pythonRawString          ctermfg=137 guifg=#a38955
hi pythonStatement          ctermfg=77 guifg=#6bd26f
hi pythonConditional        ctermfg=206 guifg=#ff6fd0
hi pythonRepeat             ctermfg=206 guifg=#ff6fd0
hi pythonException          ctermfg=206 guifg=#ff6fd0
hi pythonExceptions         ctermfg=79 guifg=#4fddb0
hi pythonInclude            ctermfg=80 guifg=#3be8c7
hi pythonEscape             ctermfg=179 guifg=#c4c249 gui=bold
hi pythonFunction           ctermfg=231 guifg=#ffffff gui=bold
hi pythonBuiltin            ctermfg=81 guifg=#66ccff gui=bold
hi pythonNumber             ctermfg=81 guifg=#66ccff gui=bold
hi pythonOperator           ctermfg=203 guifg=#f8585b

hi pythonSpecial            ctermfg=39 guifg=#00b9ff
hi pythonOperator           ctermfg=203 guifg=#ff4546
hi pythonPunctuation        ctermfg=193 guifg=#e7ffb2

" }}}

" Django {{{

hi djangoTagBlock guifg=#c1c1c1
hi djangoComBlock ctermfg=239 guifg=#008e5d gui=italic
hi djangoVarBlock guifg=#c1c1c1
hi djangoFilter guifg=#48ab50
hi djangoStatement guifg=#ff6fd0

" }}}

" Git {{{

hi gitDiffAdded ctermfg=28
hi gitDiffRemoved ctermfg=88

hi gitcommitComment ctermfg=240

" }}}
