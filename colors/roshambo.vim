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

if has('gui_macvim')
    set transparency=2
endif

"hi Normal           ctermfg=250 ctermbg=0 guifg=#c1c1c1 guibg=#1a1d1e
"hi CursorLine       cterm=none ctermbg=233 guibg=#0e1113
"hi ColorColumn      ctermbg=232 guibg=#141716

hi Normal           ctermfg=250 ctermbg=0 guifg=#c1c1c1 guibg=#161616
hi CursorLine       cterm=none ctermbg=233 guibg=#1f2221
hi ColorColumn      ctermbg=232 guibg=#1b1e1d

hi NonText          ctermfg=235 guifg=#3d464e gui=none
hi SpecialKey       guifg=#3d464e gui=none
hi Cursor           guifg=#f1f1f1 guibg=#3b464d
hi Visual           guibg=#3b464d
hi ModeMsg          guifg=#798b92 gui=italic
hi LineNr           ctermfg=238 guifg=#556166 guibg=#151A1B gui=none
hi CursorLineNr     ctermfg=242 guifg=#adadad
"hi WildMenu         guibg=#2c302d guifg=#cbecd0 gui=underline
hi PMenu            guifg=#1b313e guibg=#7abfdf
hi PMenuSel         guifg=#FFFF99 guibg=#312B2B
hi PmenuSbar        guifg=#FFFF99 guibg=#7abfdf
hi PmenuThumb       guifg=#174c63

" NOTE the foreground and background vales are totally reversed for some
" reason. In other words, foreground values apply to the background and the
" background values apply to the verical pipe: |. Really annoying!
hi VertSplit        ctermfg=233 ctermbg=235 guifg=#556166 guibg=#151A1B

hi MatchParen       guibg=#3d7b94
hi SignColumn       ctermbg=233 guibg=#121518
hi Folded           ctermfg=241 ctermbg=233 guifg=#947D7D guibg=#1A1717
"hi FoldColumn       guifg=#947D7D guibg=#121518
hi Question         guifg=#6bd26f gui=bold
hi Search           ctermfg=233 ctermbg=227 guifg=#1a1a1a guibg=#c4c249
hi Title            guifg=#e75b91
hi Error            guifg=#f0f0f0 guibg=#ff4546
hi ErrorMsg         guifg=#f0f0f0 guibg=#ff4546
hi Todo             guifg=#000000 guibg=#51a156
hi WarningMsg       guifg=#ff3a3f  gui=bold
hi TagListFileName  guifg=#B4D0E1 guibg=#495B5F

" Tabs
hi TabLineFill cterm=none ctermbg=236 guibg=#303030 gui=none
hi TabLineSel  cterm=bold ctermfg=253 ctermbg=242 guifg=#dadada guibg=#666666 gui=none
hi TabLine     cterm=none ctermfg=244 ctermbg=238 guifg=#808080 guibg=#444444 gui=none
"hi TabLineFill guibg=#343434 guibg=#333D3E gui=none
"hi TabLineSel  guifg=#e9e9e9 guibg=#1B2121 gui=none
"hi TabLine     guifg=#93C8CE guibg=#47595B gui=none

" Filesystem & NERDTree

hi Directory ctermfg=31 guifg=#0087af
hi NERDTreeOpenable ctermfg=24 guifg=#005f87

" }}}

" General {{{

hi Comment          ctermfg=239 guifg=#008e5d gui=italic
hi Operator         ctermfg=160 guifg=#ff5e57
hi String           ctermfg=29 guifg=#798b92
hi Keyword          ctermfg=22 guifg=#ff8ad9
hi Function         ctermfg=31 guifg=#51a4c5
hi Constant         ctermfg=39 guifg=#76d6ff gui=bold
hi Type             ctermfg=24 guifg=#b39967 gui=none
hi Statement        ctermfg=34 guifg=#ff8ad8 gui=none
hi Special          ctermfg=178 guifg=#d8ea9f
hi Identifier       ctermfg=29 guifg=#00c6ff
hi PreProc          ctermfg=33 guifg=#72fcd5 gui=none

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

hi javaScriptComment          ctermfg=29 guifg=#209074
hi javaScriptLineComment      ctermfg=29 guifg=#209074
hi javaScriptSpecial          ctermfg=160 guifg=#F83E42
hi javaScriptStringS          ctermfg=137 guifg=#B09B6A
hi javaScriptStringD          ctermfg=137 guifg=#B09B6A
hi javaScriptSpecialCharacter ctermfg=228 guifg=#e7ffb2
hi javaScriptIdentifier       ctermfg=38 guifg=#00afdf
hi javaScriptException        ctermfg=206 guifg=#FB82D8
hi javaScriptConditional      ctermfg=206 guifg=#FB82D8
hi javaScriptRepeat           ctermfg=206 guifg=#FB82D8
hi javaScriptBranch           ctermfg=206 guifg=#FB82D8
hi javaScriptStatement        ctermfg=206 guifg=#FB82D8
hi javaScriptOperator         ctermfg=160 guifg=#F83E42
hi javaScriptType             ctermfg=38 guifg=#41C5FD
hi javaScriptFunction         ctermfg=38 guifg=#41C5FD
hi javaScriptBraces           ctermfg=186 guifg=#E7FFB2
hi javaScriptParens           ctermfg=186 guifg=#e7ffb2
hi javaScriptBoolean          ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi javaScriptNumber           ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi javaScriptNull             ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi javaScriptRegexpString     ctermfg=35 guifg=#6BD26F
hi javaScriptGlobal           ctermfg=79 guifg=#84FFD6
hi javaScriptMember           ctermfg=79 guifg=#84FFD6

hi javaScriptDollarVariable   ctermfg=160 guifg=#F83E42
hi javaScriptPunctuation      ctermfg=228 guifg=#e7ffb2
hi javaScriptFunctionName     ctermfg=255 cterm=bold guifg=#ffffff gui=bold

" }}}

" JSX {{{

hi jsxDocComment          ctermfg=29 guifg=#209074
" jsxDocTags
hi jsxComment          ctermfg=29 guifg=#209074
hi jsxLineComment          ctermfg=29 guifg=#209074
" jsxCommentTodo
" jsxEscape
hi jsxString          ctermfg=137 guifg=#B09B6A
hi jsxInteger           ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi jsxFloat           ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi jsxFloatX           ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi jsxSpecialNumbers           ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi jsxConditional      ctermfg=206 guifg=#FB82D8
hi jsxRepeat           ctermfg=206 guifg=#FB82D8
hi jsxBranch           ctermfg=206 guifg=#FB82D8
hi jsxOperator         ctermfg=160 guifg=#F83E42
hi jsxType             ctermfg=38 guifg=#41C5FD
hi jsxStatement        ctermfg=206 guifg=#FB82D8
hi jsxFunction         ctermfg=38 guifg=#41C5FD
hi jsxBraces           ctermfg=186 guifg=#E7FFB2
hi jsxNull             ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi jsxBoolean          ctermfg=122 cterm=bold guifg=#85D5FE gui=bold
hi jsxRegexp     ctermfg=35 guifg=#6BD26F
hi jsxIdentifier       ctermfg=38 guifg=#00afdf
" jsxLabel
hi jsxException        ctermfg=206 guifg=#FB82D8
" jsxClass
" jsxModifiers
" jsxImport
" jsxEntryPoint
" jsxDebug

"hi jsxSpecial          ctermfg=160 guifg=#F83E42
"hi jsxSpecialCharacter ctermfg=228 guifg=#e7ffb2
"hi jsxParens           ctermfg=186 guifg=#e7ffb2
"hi jsxGlobal           ctermfg=79 guifg=#84FFD6
"hi jsxMember           ctermfg=79 guifg=#84FFD6

hi jsxDollarVariable   ctermfg=160 guifg=#F83E42
"hi jsxPunctuation      ctermfg=228 guifg=#e7ffb2
hi jsxFunctionName     ctermfg=255 cterm=bold guifg=#ffffff gui=bold

" }}}

" CoffeeScript {{{
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
hi coffeeSpecialVar             ctermfg=43 guifg=#3be8c7
hi coffeeObject                 ctermfg=231 cterm=bold,underline guifg=#ffffff gui=bold,underline
hi coffeeObjAssign              ctermfg=39 guifg=#00b9ff
hi coffeeSpecialIdent           ctermfg=44 guifg=#3dc7cf
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
hi coffeeDollarVariable         ctermfg=203 guifg=#e7ffb2
hi coffeeBuiltinFunction        ctermfg=68
hi coffeeSpecialVariable        ctermfg=68

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

hi gitcommitComment ctermfg=240

" }}}

" Diff {{{

hi diffFile ctermfg=24
hi diffAdded ctermfg=28 cterm=none guifg=#870000 gui=none
hi diffRemoved ctermfg=124 cterm=none guifg=#af0000 gui=none

" }}}

" Go {{{

hi goDirective ctermfg=29 cterm=bold,underline guifg=#ffffff gui=bold,underline

" }}}
