return function()
	vim.cmd([[
		let g:go_highlight_functions = 1
		let g:go_highlight_function_parameters = 1
		let g:go_highlight_function_calls = 1
		let g:go_highlight_operators = 1
		let g:go_highlight_methods = 1
		let g:go_highlight_structs = 1
		let g:go_highlight_trailing_whitespace_error = 1
		let g:go_highlight_space_tab_error = 1
		let g:go_highlight_types = 1
		let g:go_highlight_extra_types = 1
		let g:go_highlight_chan_whitespace_error = 1
		let g:go_highlight_array_whitespace_error = 1
		let g:go_highlight_build_constraints = 1
		let g:go_highlight_generate_tags = 1
		let g:go_highlight_fields = 1
		let g:go_highlight_string_spellcheck = 1
		let g:go_highlight_format_strings = 1
		let g:go_highlight_varaible_declarations = 1
		let g:go_highlight_varaible_assignments = 1
		let g:go_auto_sameids = 0
		let g:go_auto_type_info = 0
		let g:go_fmt_autosave = 0
		let g:go_imports_autosave = 0
		let g:go_fmt_options = {}
		let g:go_mod_fmt_autosave = 0
		let g:go_metalinter_autosave = 0
		let g:go_template_autocreate = 0
		let g:go_jump_to_error = 0
	]])
end
