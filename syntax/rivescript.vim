" RiveScript syntax file
" Language:    RiveScript
" Version:     0.01
" Maintainer:  Casey Kirsle
" Filenames:   *.rs
" Last Change: 30th March 2008
" Web Page:    http://www.rivescript.com/
" Changes:
"   0.01:
"     - Initial Version
"     - Only highlights whole lines of text
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" RiveScript commands
syn match rsUnknown    "^.*"    nextgroup=rsUnknownTxt contains=@NoSpell
syn match rsUnknownTxt ".*$"    contained contains=@NoSpell

syn match rsDefinition "^\s*!"  nextgroup=rsDefTxt contains=@NoSpell
syn match rsDefTxt     ".*$"    contained contains=@NoSpell

syn match rsLabel      "^\s*[<>]" nextgroup=rsLabelTxt contains=@NoSpell
syn match rsLabelTxt   ".*$"      contained contains=@NoSpell

syn match rsTrigger    "^\s*+"  nextgroup=rsTriggerTxt contains=@NoSpell
syn match rsTriggerTxt ".*$"    contained contains=@NoSpell

syn match rsReply      "^\s*-"  nextgroup=rsReplyTxt contains=@NoSpell
syn match rsReplyTxt   ".*$"    contained contains=@NoSpell

syn match rsPrevious   "^\s*%" nextgroup=rsPrevTxt contains=@NoSpell
syn match rsPrevTxt    ".*$"   contained contains=@NoSpell

syn match rsContinue   "^\s*^" nextgroup=rsContTxt contains=@NoSpell
syn match rsContTxt    ".*$"   contained contains=@NoSpell

syn match rsRedirect   "^\s*@" nextgroup=rsRedirTxt contains=@NoSpell
syn match rsRedirTxt   ".*$"   contained contains=@NoSpell

syn match rsCondition  "^\s*\*" nextgroup=rsCondTxt contains=@NoSpell
syn match rsCondTxt    ".*$"   contained contains=@NoSpell

syn match rsComment "^\s*/" nextgroup=rsComTxt contains=@NoSpell
syn match rsComTxt  ".*$"   contained contains=@NoSpell

" Define the default highlighting
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_rivescript_syntax_inits")
	if version < 508
		let did_rivescript_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	" Highlight all unknown characters as error lines
	HiLink rsUnknown    Error
	HiLink rsUnknownTxt Error

	" ! Definition in CYAN
	HiLink rsDefinition Function
	HiLink rsDefTxt     Function

	" > Label in YELLOW
	HiLink rsLabel    Statement
	HiLink rsLabelTxt Statement

	" + Trigger in RED
	HiLink rsTrigger    Tag
	HiLink rsTriggerTxt Tag

	" + Reply in BLUE
	HiLink rsReply    Include
	HiLink rsReplyTxt Include

	" + Previous in PINK
	HiLink rsPrevious String
	HiLink rsPrevTxt  String

	" ^ Continue in YELLOW
	HiLink rsContinue Keyword
	HiLink rsContTxt  Keyword

	" @ Redirect in RED
	HiLink rsRedirect Tag
	HiLink rsRedirTxt Tag

	" * Condition in CYAN
	HiLink rsCondition Function
	HiLink rsCondTxt   Function

	" / Comments in CYAN
	HiLink rsComment Comment
	HiLink rsComTxt  Comment

	delcommand HiLink
endif

" let b:current_syntax = "rivescript"

" vim: ts=8
