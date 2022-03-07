local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.load_extension("fzf")
--telescope.load_extension('git_worktree')

local r = require("user.remap").nnoremap
r("<C-p>", ":Telescope find_files<CR>")
r(";", ":Telescope buffers<CR>")
