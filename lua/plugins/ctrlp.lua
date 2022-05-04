local g = vim.g

if vim.fn.executable("rg") then
	g.ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	g.ctrlp_max_height = 25
	g.ctrlp_use_caching = 0
	g.ctrlp_jump_to_buffer = 0 -- when enabled, try to jump to a window where the file is open
	g.ctrlp_working_path_mode = "ra" -- try to find the repo root and search from there
end

vim.keymap.set("n", ";", ":CtrlPBuffer<CR>")
vim.keymap.set("n", "<c-o>", ":CtrlPMRUFiles<CR>")
