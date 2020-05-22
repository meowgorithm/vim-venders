" vim:foldmethod=marker
"
" Meowgorithm Colorscheme. A work in progress.
"
" By Christian Rocha
" Created 2010-11-04 11:36 EDT
" In New York, New York, United States
"


" Config {{{

highlight clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'Meowgorithm'

" }}}

" Vim UI {{{

hi Normal           ctermfg=250 "ctermbg=235
hi CursorLine       ctermbg=232 cterm=none
hi ColorColumn      ctermbg=234
hi NonText          ctermfg=235
hi LineNr           ctermfg=238
hi CursorLineNr     ctermfg=242 cterm=none
hi SignColumn       ctermbg=none
hi Search           ctermfg=233 ctermbg=227
hi Folded           ctermfg=243 ctermbg=236

" Autocomplete Menu
hi PMenu            ctermfg=52 ctermbg=217
hi PMenuSel         ctermfg=121 ctermbg=29
hi PmenuSbar        ctermbg=23
hi PmenuThumb       ctermbg=36

" Vertical Window Divider
"
" NOTE the foreground and background vales are totally reversed for some
" reason. In other words, foreground values apply to the background and the
" background values apply to the verical pipe: |. Really annoying!
hi VertSplit        ctermfg=236 ctermbg=236

" Tabs
hi TabLineFill cterm=none ctermbg=236
hi TabLineSel  cterm=bold ctermfg=253 ctermbg=242
hi TabLine     cterm=none ctermfg=244 ctermbg=238

" }}}

" Filesystem & NERDTree {{{

hi Directory        ctermfg=31
hi NERDTreeOpenable ctermfg=24

" }}}

" Ale {{{

hi ALEError   ctermbg=52
hi ALEWarning ctermbg=19

" }}}

" Gitgutter {{{

" By default, GitGutter uses the Diff colors here so we're overriding with
" the old defaults
"highlight GitGutterAdd    guifg=#009900 guibg=#262626 ctermfg=2 ctermbg=234
"highlight GitGutterChange guifg=#bbbb00 guibg=#262626 ctermfg=3 ctermbg=234
"highlight GitGutterDelete guifg=#ff2222 guibg=#262626 ctermfg=1 ctermbg=234
highlight GitGutterAdd          ctermfg=2
highlight GitGutterChange       ctermfg=3
highlight GitGutterChangeDelete ctermfg=3
highlight GitGutterDelete       ctermfg=1

" }}}

" Highlighted Yank {{{

highlight HighlightedyankRegion ctermbg=60

" }}}

" Lanuage Defaults {{{

"hi Comment          ctermfg=239
"hi Operator         ctermfg=203
"hi String           ctermfg=29
"hi Keyword          ctermfg=206
"hi Function         ctermfg=42
"hi Constant         ctermfg=80 cterm=bold
"hi Type             ctermfg=138
"hi Statement        ctermfg=71
"hi Special          ctermfg=178
"hi Identifier       ctermfg=29
"hi PreProc          ctermfg=33

" }}}

" CSS {{{

hi cssComment        ctermfg=241
hi cssInclude        ctermfg=125
hi cssURL            ctermfg=191
hi cssStringQQ       ctermfg=185
hi cssTagName        ctermfg=161
hi cssClassName      ctermfg=206
hi cssPseudoClass    ctermfg=219
hi cssSelectorOp     ctermfg=167
hi cssMiscProp       ctermfg=49
hi scssProperty      ctermfg=49
hi cssCommonAttr     ctermfg=32
hi cssUnitDecorators ctermfg=45
hi scssAttribute     ctermfg=229
hi cssBraces         ctermfg=229
hi scssSemicolon     ctermfg=229
hi scssVariable      ctermfg=159
hi scssInclude       ctermfg=255 cterm=bold,underline
hi scssMixinName     ctermfg=75
hi scssMixinParams   ctermfg=75
hi scssAmpersand     ctermfg=204
hi scssSelectorChar  ctermfg=212
hi scssFunctionName ctermfg=105
hi scssImport ctermfg=69 cterm=underline

hi link scssComment             cssComment
hi link scssSelectorName        cssClassName
hi link cssPseudoClassId        cssPseudoClass
hi link cssValueNumber          cssTextAttr
hi link cssStringQ              cssStringQQ
hi link cssFontProp             cssMiscProp
hi link cssColorProp            cssMiscProp
hi link cssTextProp             cssMiscProp
hi link cssBoxProp              cssMiscProp
hi link cssRenderProp           cssMiscProp
hi link cssAuralProp            cssMiscProp
hi link cssGeneratedContentProp cssMiscProp
hi link cssPagingProp           cssMiscProp
hi link cssTableProp            cssMiscProp
hi link cssUIProp               cssMiscProp
hi link cssAnimationProp        cssMiscProp
hi link cssBackgroundProp       cssMiscProp
hi link cssPositioningProp      cssMiscProp
hi link cssMediaProp            cssMiscProp
hi link cssTransformProp        cssMiscProp
hi link cssBorderProp           cssMiscProp
hi link cssFlexibleBoxProp      cssMiscProp
hi link cssMultiColumnProp      cssMiscProp
hi link cssListProp             cssMiscProp
hi link cssKeyframeProp         cssMiscProp
hi link cssFontAttr             cssCommonAttr
hi link cssTextAttr             cssCommonAttr
hi link cssColorAttr            cssCommonAttr
hi link cssBoxAttr              cssCommonAttr
hi link cssRenderAttr           cssCommonAttr
hi link cssAuralAttr            cssCommonAttr
hi link cssMiscAttr             cssCommonAttr
hi link cssPositioningAttr      cssCommonAttr
hi link cssColor                cssCommonAttr
hi link cssInteger              cssCommonAttr
hi link cssValueNumber          cssCommonAttr
hi link cssValueInteger         cssCommonAttr
hi link cssValueLength          cssCommonAttr
hi link cssValueAngle           cssCommonAttr
hi link cssValueTime            cssCommonAttr
hi link cssValueFrequency       cssCommonAttr
hi link cssAnimationAttr        cssCommonAttr

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

hi link             jsTemplateString jsString
hi jsComment        ctermfg=29
hi link             jsObjectStringKey jsString
hi link             jsClassStringKey jsString
hi jsString         ctermfg=137
hi jsTemplateVar    ctermfg=61
hi link             jsBooleanTrue jsConst
hi link             jsBooleanFalse jsConst
hi link             jsNumber jsConst
hi link             jsNull jsConst
hi link             jsNan jsConst
hi jsConst          ctermfg=121 cterm=bold
hi jsGlobalObjects  ctermfg=166
hi jsThis           ctermfg=38
hi jsPrototype      ctermfg=38
hi jsFunction       ctermfg=38
hi jsArrowFunction  ctermfg=38
hi jsGenerator      ctermfg=38
hi jsFuncName       ctermfg=254
hi jsObjectFuncName ctermfg=77
hi jsFuncArgs       ctermfg=245

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

" JSON {{{

hi link jsonBraces       jsonNoise
hi link jsonKeywordMatch jsonNoise

hi jsonNoise ctermfg=229
hi jsonQuote ctermfg=61
hi jsonKeyword ctermfg=61
hi jsonString ctermfg=68
hi jsonNumber ctermfg=43
hi jsonBoolean ctermfg=204
hi jsonEscape ctermfg=224

" }}}

" XML (Also JSX) {{{

hi link      xmlTagName xmlTag
hi link      xmlEndTag xmlTag
hi link      xmlEqual xmlTag
hi xmlTag    ctermfg=95
hi link      xmlAttribPunct xmlAttrib
hi xmlAttrib ctermfg=131
hi xmlString ctermfg=104

" }}}

" CoffeeScript {{{

hi coffeeKeyword         ctermfg=77
hi coffeeConditional     ctermfg=206
hi coffeeRepeat          ctermfg=206
hi coffeeException       ctermfg=77
hi coffeeStatement       ctermfg=77
hi coffeeString          ctermfg=102
hi coffeeRegex           ctermfg=62
hi coffeeEscape          ctermfg=179 cterm=bold
hi coffeeGlobal          ctermfg=81
hi coffeeBoolean         ctermfg=39
hi coffeeAssign          ctermfg=137
hi coffeeAssignSymbols   ctermfg=160
hi coffeeSpecialVar      ctermfg=43
hi coffeeObject          ctermfg=231 cterm=bold,underline
hi coffeeObjAssign       ctermfg=39
hi coffeeSpecialIdent    ctermfg=44
hi coffeeComment         ctermfg=29
hi coffeeFunction        ctermfg=67
hi coffeeOperator        ctermfg=203
hi coffeeAssignBrackets  ctermfg=193
hi coffeeConstant        ctermfg=81 cterm=bold
hi coffeeNumber          ctermfg=81 cterm=bold
hi coffeeFloat           ctermfg=81 cterm=bold

hi coffeePunctutation    ctermfg=193
hi coffeeDollarVariable  ctermfg=203
hi coffeeBuiltinFunction ctermfg=68
hi coffeeSpecialVariable ctermfg=68

" }}}

" Python {{{

"let python_highlight_all = 1

hi pythonComment     ctermfg=29
hi pythonString      ctermfg=102
hi pythonRawString   ctermfg=137
hi pythonStatement   ctermfg=77
hi pythonConditional ctermfg=206
hi pythonRepeat      ctermfg=206
hi pythonException   ctermfg=206
hi pythonExceptions  ctermfg=79
hi pythonInclude     ctermfg=80
hi pythonEscape      ctermfg=179
hi pythonFunction    ctermfg=231
hi pythonBuiltin     ctermfg=81
hi pythonNumber      ctermfg=81
hi pythonOperator    ctermfg=203

hi pythonSpecial     ctermfg=39
hi pythonOperator    ctermfg=203
hi pythonPunctuation ctermfg=193

" }}}

" Go {{{

" Statements
hi goDirective ctermfg=198 cterm=bold

" Keywords within functions
hi goStatement   ctermfg=170
hi goConditional ctermfg=170
hi goLabel       ctermfg=170
hi goRepeat      ctermfg=170

hi goBuiltins ctermfg=208

" Declarations
hi goPackage     ctermfg=204 cterm=bold
hi goImport      ctermfg=204
hi goConst       ctermfg=169
hi link goTypeDecl goVar
hi link goConst goVar
hi goVar         ctermfg=169
hi goDeclaration ctermfg=77  "func
hi goDeclType    ctermfg=105 "struct, interface
hi goTypeName    ctermfg=95
hi goFunction    ctermfg=255 "function names

" Boolean
hi goBoolean ctermfg=45

" Numbers
hi goDecimalInt     ctermfg=45
hi goHexadecimalInt ctermfg=45
hi goOctalInt       ctermfg=45
hi goImaginary      ctermfg=45

" Types
hi goType         ctermfg=95
hi goSignedInts   ctermfg=95
hi goUnsignedInts ctermfg=95
hi goFloats       ctermfg=95
hi goComplexes    ctermfg=95
hi goExtraType    ctermfg=95

" Escapes
hi goEscapeOctal ctermfg=33
hi goEcscapeC    ctermfg=33
hi goEscapeU     ctermfg=33
hi goEscapeBigU  ctermfg=33

" Strings
hi goString          ctermfg=137
hi goRawString       ctermfg=29
hi goFormatSpecifier ctermfg=211 "29

" Comments
hi goCommentGroup ctermfg=240
hi goComment      ctermfg=240 "29

" Operators
hi goOperator ctermfg=203

" Structs & Methods
hi goMethod       ctermfg=31
hi goStruct       ctermfg=208
hi goStructDef    ctermfg=255 cterm=bold,underline
hi goReceiverType ctermfg=95 "method parent types
hi goField        ctermfg=38 "29


" }}}

" Go Mod {{{

hi gomodModule ctermfg=204 cterm=bold
hi gomodGo ctermfg=42
hi gomodGoVersion ctermfg=42 cterm=underline
hi gomodRequire ctermfg=204
hi gomodVersion ctermfg=95
hi gomodComment ctermfg=29
hi gomodReplace ctermfg=69
hi gomodReplaceOperator ctermfg=62

" }}}

" Elm {{{

hi elmImport              ctermfg=39
hi elmDelimiter           ctermfg=222
hi elmBraces              ctermfg=222
hi elmType                ctermfg=71 cterm=bold
hi elmTopLevelDecl        ctermfg=95
hi elmConditional         ctermfg=169
hi elmAlias               ctermfg=105
hi elmTypedef             ctermfg=212
hi elmOperator            ctermfg=167
hi elmFuncName            ctermfg=105
hi link                   elmLineComment elmComment
hi elmComment             ctermfg=242
hi elmCaseBlockDefinition ctermfg=115
hi elmInt                 ctermfg=39
hi elmString              ctermfg=137

" }}}

" Haskell {{{

hi link                  haskellBlockComment haskellLineComment
hi haskellLineComment    ctermfg=241
hi haskellNumber         ctermfg=50
hi haskellString         ctermfg=137
hi haskellPragma         ctermfg=216
hi haskellImportKeywords ctermfg=39
hi haskellParens         ctermfg=37 " imports and tuples
hi haskellDeclKeyword    ctermfg=50
hi haskellDecl           ctermfg=212
hi link                  haskellLet haskellKeyword
hi link                  haskellDerive haskellKeyword
hi link                  haskellConditional haskellKeyword
hi link                  haskellWhere haskellKeyword
hi haskellKeyword        ctermfg=212
hi haskellType           ctermfg=78
hi haskellIdentifier     ctermfg=105 " type signatures and record members
hi haskellDelimiter      ctermfg=192
hi haskellBacktick       ctermfg=33
hi haskellOperators      ctermfg=210

" }}}

" SQL/PostgreSQL {{{

hi sqlSpecial        ctermfg=204 cterm=bold,underline
hi sqlCatalog        ctermfg=204 cterm=bold,underline
hi sqlConstant       ctermfg=204 cterm=bold,underline
hi sqlErrorCode      ctermfg=204 cterm=bold,underline
hi sqlFunction       ctermfg=211 cterm=bold
hi sqlIdentifier     ctermfg=204 cterm=bold,underline
hi sqlplpgsqlKeyword ctermfg=204 cterm=bold,underline
hi sqlOperator       ctermfg=204 cterm=bold,underline
hi sqlOption         ctermfg=204 cterm=bold,underline
hi sqlSpecial        ctermfg=204 cterm=bold,underline
hi sqlTable          ctermfg=204 cterm=bold,underline
hi sqlView           ctermfg=204 cterm=bold,underline
hi sqlVariable       ctermfg=203 cterm=bold,underline
hi sqlPsqlCommand    ctermfg=203 cterm=bold,underline
hi sqlPsqlKeyword    ctermfg=203 cterm=bold,underline

hi sqlType      ctermfg=206
hi sqlStatement ctermfg=34 " CREATE, UPDATE, DELETE, EXECUTE, etc.
hi sqlComment   ctermfg=240
hi sqlString    ctermfg=137
hi sqlNumber    ctermfg=202
hi sqlKeyword   ctermfg=32

" }}}

" Git {{{

hi gitcommitComment ctermfg=240

" }}}

" Diff {{{

hi diffFile    ctermfg=24
hi diffAdded   ctermfg=28  cterm=none
hi diffRemoved ctermfg=124 cterm=none

" }}}
