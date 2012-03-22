"
" Roshambo Colorscheme. A work in progress.
"
" By Roshambo
" Created 2010-11-04 11:36 EDT
" In New York, New York, United States
"


" CONFIG

highlight clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'Roshambo'


" COMMON

if has('mac')
	set transparency=4
endif

hi NonText        guifg=#3d464e gui=none
hi SpecialKey     guifg=#3d464e gui=none
hi Normal         guifg=#c1c1c1 guibg=#1a1d1e
hi Cursor         guifg=#f1f1f1 guibg=#3b464d

hi CursorLine     guibg=#0e1113
hi Visual         guibg=#3b464d
hi ModeMsg        guifg=#798b92 gui=italic
hi LineNr         guifg=#556166 guibg=#151A1B gui=none
"hi WildMenu       guibg=#2c302d guifg=#cbecd0 gui=underline
hi PMenu          guifg=#1b313e guibg=#7abfdf
hi PMenuSel       guifg=#FFFF99 guibg=#312B2B
hi PmenuSbar      guifg=#FFFF99 guibg=#7abfdf
hi PmenuThumb     guifg=#174c63
hi VertSplit      guifg=#556166 guibg=#151A1B
hi Folded         guifg=#947D7D guibg=#1A1717
hi MatchParen     guibg=#3d7b94
hi SignColumn     guibg=#121518
hi FoldColumn     guifg=#947D7D guibg=#121518
hi Question       guifg=#6bd26f gui=bold
hi Search         guibg=#c4c249
hi Title          guifg=#e75b91
hi Error          guifg=#f0f0f0 guibg=#ff4546
hi ErrorMsg       guifg=#f0f0f0 guibg=#ff4546
hi Todo           guifg=#000000 guibg=#51a156
hi WarningMsg     guifg=#ff3a3f  gui=bold

hi TagListFileName guifg=#B4D0E1 guibg=#495B5F

hi Comment        guifg=#008e5d gui=italic
hi Operator       guifg=#ff5e57
hi String         guifg=#798b92
hi Keyword        guifg=#ff8ad9
hi Function       guifg=#51a4c5
hi Constant       guifg=#76d6ff gui=bold
hi Type           guifg=#b39967 gui=none
hi Statement      guifg=#ff8ad8 gui=none
hi Special        guifg=#d8ea9f
hi Identifier     guifg=#00c6ff
hi PreProc        guifg=#72fcd5 gui=none

" TABS
hi TabLineFill guibg=#343434 guibg=#333D3E gui=none
hi TabLineSel  guifg=#e9e9e9 guibg=#1B2121 gui=none
hi TabLine     guifg=#93C8CE guibg=#47595B gui=none

" STATUSLINE

"hi StatusLine                  guifg=#B4D0E1 guibg=#495B5F gui=none
hi StatusLine                  guifg=#e2eb23 guibg=#2085ad gui=none
hi StatusLineNC                guifg=#5D7075 guibg=#2C383A gui=none
"au InsertEnter * hi StatusLine guifg=#131617 guibg=#a3aa52 gui=bold
au InsertEnter * hi StatusLine guifg=#7a2d2e guibg=#4bbfa1 gui=bold
au InsertLeave * hi StatusLine guifg=#e2eb23 guibg=#2085ad gui=none

" NERDTree

"hi TreeDir guifg=#b39967

" CSS

hi cssComment              guifg=#798b92 gui=none
hi cssImportant            guifg=#ff5e57 gui=bold
hi cssInclude              guifg=#46EFFE gui=bold
hi cssBraces               guifg=#e8fcb0
hi cssURL                  guifg=#c8de83
hi cssStringQ              guifg=#c8de83
hi cssStringQQ             guifg=#c8de83
hi cssTagName              guifg=#ff5da1
hi cssClassName            guifg=#ff8ad8
hi cssIdentifier           guifg=#ff2f93
hi cssPseudoClass          guifg=#C563A7
hi cssPseudoClassId        guifg=#C563A7
hi cssSelectorOp           guifg=#AA5590

hi cssFontProp             guifg=#60edc8
hi cssColorProp            guifg=#60edc8
hi cssTextProp             guifg=#60edc8
hi cssBoxProp              guifg=#60edc8
hi cssRenderProp           guifg=#60edc8
hi cssAuralProp            guifg=#60edc8
hi cssGeneratedContentProp guifg=#60edc8
hi cssPagingProp           guifg=#60edc8
hi cssTableProp            guifg=#60edc8
hi cssUIProp               guifg=#60edc8

hi cssCommonAttr           guifg=#51a4c5
hi cssFontAttr             guifg=#51a4c5
hi cssTextAttr             guifg=#51a4c5
hi cssColorAttr            guifg=#51a4c5
hi cssBoxAttr              guifg=#51a4c5
hi cssRenderAttr           guifg=#51a4c5
hi cssAuralAttr            guifg=#51a4c5
hi cssColor                guifg=#51a4c5
hi cssInteger              guifg=#51a4c5
hi cssValueNumber          guifg=#51a4c5 gui=none
hi cssValueInteger         guifg=#51a4c5 gui=none
hi cssValueLength          guifg=#51a4c5 gui=none
hi cssValueAngle           guifg=#51a4c5 gui=none
hi cssValueTime            guifg=#51a4c5 gui=none
hi cssValueFrequency       guifg=#51a4c5 gui=none

" LESS

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

" STYLUS
hi stylusVariable guifg=#3fced3
hi stylusFunction guifg=#2eb5dc
hi stylusComment guifg=#798b92

" HTML

hi htmlTag           guifg=#3EADFD
hi htmlTagName       guifg=#3EADFD
hi htmlArg           guifg=#46EFFE
hi htmlString        guifg=#D7EDA1
hi htmlSpecialChar   guifg=#ffffff gui=bold
hi htmlTitle         guifg=#c1c1c1
hi htmlH1            guifg=#c1c1c1
hi def link htmlLink Normal
hi htmlDoctype       guifg=#af98ff gui=bold
hi htmlBlockTag      guifg=#f53d92

" PHP

hi phpComment                 guifg=#1D915E gui=italic
hi phpString                  guifg=#7B8B92
hi phpConstant                guifg=#01ecff
hi phpKeyword                 guifg=#03b9ff
hi phpConditional             guifg=#03b9ff
hi phpFunctions               guifg=#4edeb0

" JavaScript

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

" Coffee-Script
hi coffeeKeyword guifg=#6bd26f
hi coffeeConditional guifg=#ff6fd0
hi coffeeRepeat guifg=#ff6fd0
hi coffeeException guifg=#6bd26f
hi coffeeStatement guifg=#6bd26f
hi coffeeString guifg=#7b8b92
hi coffeeRegex guifg=#6d73ea
hi coffeeEscape guifg=#c4c249 gui=bold
hi coffeeGlobal guifg=#41c5fd
hi coffeeBoolean guifg=#00b9ff
hi coffeeAssign guifg=#b09b6a
hi coffeeAssignSymbols guifg=#f8585b
hi coffeeSpecialVar guifg=#3be8c7
hi coffeeObject guifg=#ffffff gui=bold,underline
hi coffeeComment guifg=#1d915e gui=italic
hi coffeeFunction guifg=#4974ac
hi coffeeOperator guifg=#f8585b
hi coffeeAssignBrackets guifg=#e7ffb2
hi coffeeConstant guifg=#66ccff gui=bold
hi coffeeNumber guifg=#66ccff gui=bold
hi coffeeFloat guifg=#66ccff gui=bold
"hi coffeePrototype guifg=#e9e9e9 gui=bold
"hi coffeeDot guifg=#e9e9e9 gui=bold

hi coffeePunctutation guifg=#e7ffb2

" Python

"let python_highlight_all = 1

hi pythonComment              guifg=#1d915e  gui=italic
hi pythonString               guifg=#7b8b92
hi pythonRawString            guifg=#a38955
hi pythonStatement            guifg=#6bd26f
hi pythonConditional          guifg=#ff6fd0
hi pythonRepeat               guifg=#ff6fd0
hi pythonException            guifg=#ff6fd0
hi pythonExceptions           guifg=#4fddb0
hi pythonInclude              guifg=#3be8c7
hi pythonEscape               guifg=#c4c249 gui=bold
hi pythonFunction             guifg=#ffffff gui=bold
hi pythonBuiltin              guifg=#66ccff gui=bold
hi pythonNumber               guifg=#66ccff gui=bold
hi pythonOperator             guifg=#f8585b

hi pythonSpecial guifg=#00b9ff
hi pythonOperator guifg=#ff4546
hi pythonPunctuation guifg=#e7ffb2

" Django

hi djangoTagBlock guifg=#c1c1c1
hi djangoComBlock guifg=#c1c1c1
hi djangoVarBlock guifg=#c1c1c1
hi djangoFilter guifg=#48ab50
hi djangoStatement guifg=#ff6fd0
