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

hi Normal           ctermfg=250 ctermbg=232
hi CursorLine       cterm=none ctermbg=234
hi ColorColumn      ctermbg=233

hi NonText          ctermfg=235
hi SpecialKey       guifg=#3d464e gui=none
"hi Cursor           guifg=#f1f1f1 guibg=#3b464d
"hi Visual           guibg=#3b464d
"hi ModeMsg          guifg=#798b92 gui=italic
hi LineNr           ctermfg=238
hi CursorLineNr     ctermfg=242
"hi WildMenu         guibg=#2c302d guifg=#cbecd0 gui=underline
hi PMenu            ctermfg=121 ctermbg=29
hi PMenuSel         ctermfg=52 ctermbg=217
hi PmenuSbar        ctermbg=23
hi PmenuThumb       ctermbg=36

" NOTE the foreground and background vales are totally reversed for some
" reason. In other words, foreground values apply to the background and the
" background values apply to the verical pipe: |. Really annoying!
hi VertSplit        ctermfg=233 ctermbg=235

"hi MatchParen       guibg=#3d7b94
hi SignColumn       ctermbg=233 guibg=#121518
hi Folded           ctermfg=241 ctermbg=233
"hi FoldColumn       guifg=#947D7D guibg=#121518
"hi Question         guifg=#6bd26f gui=bold
hi Search           ctermfg=233 ctermbg=227
"hi Title            guifg=#e75b91
"hi Error            guifg=#f0f0f0 guibg=#ff4546
"hi ErrorMsg         guifg=#f0f0f0 guibg=#ff4546
"hi Todo             guifg=#000000 guibg=#51a156
"hi WarningMsg       guifg=#ff3a3f  gui=bold
"hi TagListFileName  guifg=#B4D0E1 guibg=#495B5F

" Tabs
hi TabLineFill cterm=none ctermbg=236
hi TabLineSel  cterm=bold ctermfg=253 ctermbg=242
hi TabLine     cterm=none ctermfg=244 ctermbg=238
"hi TabLineFill guibg=#343434 guibg=#333D3E gui=none
"hi TabLineSel  guifg=#e9e9e9 guibg=#1B2121 gui=none
"hi TabLine     guifg=#93C8CE guibg=#47595B gui=none

" Filesystem & NERDTree

hi Directory ctermfg=31
hi NERDTreeOpenable ctermfg=24

" }}}

" Ale {{{

hi ALEError ctermbg=52
hi ALEWarning ctermbg=19

" }}}

" General {{{

hi Comment          ctermfg=239
hi Operator         ctermfg=203
hi String           ctermfg=29
hi Keyword          ctermfg=206
hi Function         ctermfg=42
hi Constant         ctermfg=80 cterm=bold
hi Type             ctermfg=138
hi Statement        ctermfg=71
hi Special          ctermfg=178
hi Identifier       ctermfg=29
hi PreProc          ctermfg=33

" }}}

" CSS {{{

"hi cssComment              guifg=#798b92 gui=none
"hi cssImportant            guifg=#ff5e57 gui=bold
hi cssInclude              ctermfg=125
"hi cssBraces               guifg=#e8fcb0
hi cssURL                  ctermfg=191
hi cssStringQ              ctermfg=185
hi cssStringQQ             ctermfg=185
hi cssTagName              ctermfg=161
hi cssClassName            ctermfg=206
"hi cssIdentifier           guifg=#ff2f93
hi cssPseudoClass          ctermfg=177
hi cssPseudoClassId        ctermfg=177
hi cssSelectorOp           ctermfg=167

hi cssFontProp             ctermfg=37
hi cssColorProp            ctermfg=37
hi cssTextProp             ctermfg=37
hi cssBoxProp              ctermfg=37
hi cssRenderProp           ctermfg=37
hi cssAuralProp            ctermfg=37
hi cssGeneratedContentProp ctermfg=37
hi cssPagingProp           ctermfg=37
hi cssTableProp            ctermfg=37
hi cssUIProp               ctermfg=37
hi cssMiscProp             ctermfg=37

hi cssCommonAttr           ctermfg=24
hi cssFontAttr             ctermfg=24
hi cssTextAttr             ctermfg=24
hi cssColorAttr            ctermfg=24
hi cssBoxAttr              ctermfg=24
hi cssRenderAttr           ctermfg=24
hi cssAuralAttr            ctermfg=24
hi cssMiscAttr             ctermfg=24
hi cssColor                ctermfg=24
hi cssInteger              ctermfg=24
hi cssValueNumber          ctermfg=24
hi cssValueInteger         ctermfg=24
hi cssValueLength          ctermfg=24
hi cssValueAngle           ctermfg=24
hi cssValueTime            ctermfg=24
hi cssValueFrequency       ctermfg=24

" }}}

" HTML {{{

hi htmlTag           ctermfg=75
hi htmlTagName       ctermfg=75
hi htmlArg           ctermfg=87
hi htmlString        ctermfg=193
hi htmlSpecialChar   ctermfg=231
hi htmlTitle         ctermfg=250
hi htmlH1            ctermfg=250
hi def link htmlLink Normal
hi htmlDoctype       ctermfg=141
hi htmlBlockTag      ctermfg=204

" }}}

" JavaScript (Built-in) {{{

hi javaScriptComment          ctermfg=29
hi javaScriptLineComment      ctermfg=29
hi javaScriptSpecial          ctermfg=160
hi javaScriptStringS          ctermfg=137
hi javaScriptStringD          ctermfg=137
hi javaScriptSpecialCharacter ctermfg=228
hi javaScriptIdentifier       ctermfg=38
hi javaScriptException        ctermfg=206
hi javaScriptConditional      ctermfg=206
hi javaScriptRepeat           ctermfg=206
hi javaScriptBranch           ctermfg=206
hi javaScriptStatement        ctermfg=206
hi javaScriptOperator         ctermfg=160
hi javaScriptType             ctermfg=38
hi javaScriptFunction         ctermfg=38
hi javaScriptBraces           ctermfg=186
hi javaScriptParens           ctermfg=186
hi javaScriptBoolean          ctermfg=122 cterm=bold
hi javaScriptNumber           ctermfg=122 cterm=bold
hi javaScriptNull             ctermfg=122 cterm=bold
hi javaScriptRegexpString     ctermfg=35
hi javaScriptGlobal           ctermfg=79
hi javaScriptMember           ctermfg=79

hi javaScriptDollarVariable   ctermfg=160
hi javaScriptPunctuation      ctermfg=228
hi javaScriptFunctionName     ctermfg=255 cterm=bold

" }}}

" JavaScript (pangloss/vim-javascript) {{{

hi link jsTemplateString jsString
hi jsComment ctermfg=29

hi link jsObjectStringKey jsString
hi link jsClassStringKey jsString
hi jsString ctermfg=137
hi jsTemplateVar ctermfg=61

hi link jsBooleanTrue jsConst
hi link jsBooleanFalse jsConst
hi link jsNumber jsConst
hi link jsNull jsConst
hi link jsNan jsConst
hi jsConst ctermfg=121 cterm=bold

hi jsGlobalObjects ctermfg=166
hi jsThis ctermfg=38
hi jsPrototype ctermfg=38

hi jsFunction ctermfg=38
hi jsArrowFunction ctermfg=38
hi jsGenerator ctermfg=38
hi jsFuncName ctermfg=254
hi jsObjectFuncName ctermfg=77
hi jsFuncArgs ctermfg=245

" Class declaration
hi link jsExtendsKeyword jsClassKeyword
hi jsClassKeyword ctermfg=77
hi jsClassFuncName ctermfg=254 cterm=bold
hi jsClassDefinition ctermfg=194 cterm=bold

hi jsDecorator ctermfg=34
hi jsDecoratorFunction ctermfg=28
hi jsParensDecorator ctermfg=34

" Import/export
hi link jsFrom jsImport
hi link jsModuleAs jsImport
hi link jsExportDefault jsImport
hi link jsExport jsImport
hi jsImport ctermfg=205
hi jsModuleDefault ctermfg=213

hi link jsAsyncKeyword jsKeyword
hi link jsAwaitKeyword jsKeyword
hi link jsStorageClass jsKeyword
hi link jsConditional jsKeyword
hi link jsReturn jsKeyword
hi link jsRepeat jsKeyword
hi link jsDo jsKeyword
hi link jsTry jsKeyword
hi link jsCatch jsKeyword
hi link jsFinally jsKeyword
hi jsKeyword ctermfg=206

hi link jsRegexpBoundary jsRegexpSpecial
hi link jsRegexpQuantifier jsRegexpSpecial
hi link jsRegexpMod jsRegexpSpecial
hi link jsRegexpBackRef jsRegexpSpecial
hi jsRegexpSpecial ctermfg=63
hi jsRegexpCharClass ctermfg=61

hi link jsArguments jsSpecial
hi jsSpecial ctermfg=61

hi link jsRestOperator jsOperator
hi link jsSpreadOperator jsOperator
hi link jsTernaryIfOperator jsOperator
hi link jsOf jsOperator
hi jsOperator ctermfg=197

hi link jsBraces jsNoise
hi link jsParens jsNoise
hi link jsFuncBraces jsNoise
hi link jsFuncParens jsNoise
hi link jsBrackets jsNoise
hi link jsIfElseBraces jsNoise
hi link jsSwitchBraces jsNoise
hi link jsRepeatBraces jsNoise
hi link jsClassBraces jsNoise
hi link jsClassNoise jsNoise
hi link jsDestructuringBraces jsNoise
hi link jsObjectBraces jsNoise
hi link jsObjectSeparator jsNoise
hi link jsModuleAsterisk jsNoise
hi jsNoise ctermfg=228 guifg=#e7ffb2

" }}}

" XML (Also JSX) {{{

hi link xmlTagName xmlTag
hi link xmlEndTag xmlTag
hi link xmlEqual xmlTag
hi xmlTag ctermfg=95
hi link xmlAttribPunct xmlAttrib
hi xmlAttrib ctermfg=131
hi xmlString ctermfg=104

" }}}

" CoffeeScript {{{
hi coffeeKeyword                ctermfg=77
hi coffeeConditional            ctermfg=206
hi coffeeRepeat                 ctermfg=206
hi coffeeException              ctermfg=77
hi coffeeStatement              ctermfg=77
hi coffeeString                 ctermfg=102
hi coffeeRegex                  ctermfg=62
hi coffeeEscape                 ctermfg=179 cterm=bold
hi coffeeGlobal                 ctermfg=81
hi coffeeBoolean                ctermfg=39
hi coffeeAssign                 ctermfg=137
hi coffeeAssignSymbols          ctermfg=160
hi coffeeSpecialVar             ctermfg=43
hi coffeeObject                 ctermfg=231 cterm=bold,underline
hi coffeeObjAssign              ctermfg=39
hi coffeeSpecialIdent           ctermfg=44
hi coffeeComment                ctermfg=29
hi coffeeFunction               ctermfg=67
hi coffeeOperator               ctermfg=203
hi coffeeAssignBrackets         ctermfg=193
hi coffeeConstant               ctermfg=81 cterm=bold
hi coffeeNumber                 ctermfg=81 cterm=bold
hi coffeeFloat                  ctermfg=81 cterm=bold

hi coffeePunctutation           ctermfg=193
hi coffeeDollarVariable         ctermfg=203
hi coffeeBuiltinFunction        ctermfg=68
hi coffeeSpecialVariable        ctermfg=68

" }}}

" Python {{{

"let python_highlight_all = 1

hi pythonComment            ctermfg=29
hi pythonString             ctermfg=102
hi pythonRawString          ctermfg=137
hi pythonStatement          ctermfg=77
hi pythonConditional        ctermfg=206
hi pythonRepeat             ctermfg=206
hi pythonException          ctermfg=206
hi pythonExceptions         ctermfg=79
hi pythonInclude            ctermfg=80
hi pythonEscape             ctermfg=179
hi pythonFunction           ctermfg=231
hi pythonBuiltin            ctermfg=81
hi pythonNumber             ctermfg=81
hi pythonOperator           ctermfg=203

hi pythonSpecial            ctermfg=39
hi pythonOperator           ctermfg=203
hi pythonPunctuation        ctermfg=193

" }}}

" Go {{{

" Statements
hi goDirective        ctermfg=198 cterm=bold

" Keywords
hi goDeclaration      ctermfg=170 " var const type
hi goDeclType         ctermfg=170 " struct interface

" Keywords within functions
hi goStatement        ctermfg=170
hi goConditional      ctermfg=170
hi goLabel            ctermfg=170
hi goRepeat           ctermfg=170

hi goBuiltins         ctermfg=208

" Boolean
hi goBoolean          ctermfg=45

" Numbers
hi goDecimalInt       ctermfg=45
hi goHexadecimalInt   ctermfg=45
hi goOctalInt         ctermfg=45
hi goImaginary        ctermfg=45

" Types
hi goType ctermfg=95
hi goSignedInts ctermfg=95
hi goUnsignedInts ctermfg=95
hi goFloats ctermfg=95
hi goComplexes ctermfg=95
hi goExtraType ctermfg=95

" Func
hi goDeclaration ctermfg=77

" Esacpes
hi goEscapeOctal ctermfg=33
hi goEcscapeC ctermfg=33
hi goEscapeU ctermfg=33
hi goEscapeBigU ctermfg=33

" Strings
hi goString ctermfg=137
hi goRawString ctermfg=29
hi goFormatSpecifier ctermfg=29

" Comments
hi goCommentGroup ctermfg=240
hi goComment ctermfg=240 " 29

" Operators
hi goOperator ctermfg=203

" Structs & Methods
hi goMethod ctermfg=31
hi goStruct ctermfg=208
hi goStructDef ctermfg=255 cterm=bold,underline

hi goFunction ctermfg=255

" }}}

" Elm {{{

hi elmImport ctermfg=39
hi elmDelimiter ctermfg=222
hi elmBraces ctermfg=222
hi elmType ctermfg=71 cterm=bold
hi elmTopLevelDecl ctermfg=95
hi elmConditional ctermfg=169
hi elmAlias ctermfg=105
hi elmTypedef ctermfg=212
hi elmOperator ctermfg=167

" }}}

" SQL/PostgreSQL {{{

hi sqlSpecial ctermfg=204 cterm=bold,underline
hi sqlCatalog ctermfg=204 cterm=bold,underline
hi sqlConstant ctermfg=204 cterm=bold,underline
hi sqlErrorCode ctermfg=204 cterm=bold,underline
hi sqlFunction ctermfg=211 cterm=bold
hi sqlIdentifier ctermfg=204 cterm=bold,underline
hi sqlplpgsqlKeyword ctermfg=204 cterm=bold,underline
hi sqlOperator ctermfg=204 cterm=bold,underline
hi sqlOption ctermfg=204 cterm=bold,underline
hi sqlSpecial ctermfg=204 cterm=bold,underline
hi sqlTable ctermfg=204 cterm=bold,underline
hi sqlView ctermfg=204 cterm=bold,underline
hi sqlVariable ctermfg=203 cterm=bold,underline
hi sqlPsqlCommand ctermfg=203 cterm=bold,underline
hi sqlPsqlKeyword ctermfg=203 cterm=bold,underline

hi sqlType ctermfg=206
hi sqlStatement ctermfg=34 " CREATE, UPDATE, DELETE, EXECUTE, etc.
hi sqlComment ctermfg=240
hi sqlString ctermfg=137
hi sqlNumber ctermfg=202
hi sqlKeyword ctermfg=32

" }}}

" Git {{{

hi gitcommitComment ctermfg=240

" }}}

" Diff {{{

hi diffFile ctermfg=24
hi diffAdded ctermfg=28 cterm=none
hi diffRemoved ctermfg=124 cterm=none

" }}}
