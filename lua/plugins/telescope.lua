local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

--telescope.load_extension('fzf')
--telescope.load_extension('git_worktree')

vim.keymap.set("<C-p>", ":Telescope find_files<CR>")
vim.keymap.set(";", ":Telescope buffers<CR>")
