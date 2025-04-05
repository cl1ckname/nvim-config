local telescope = require('telescope')
telescope.setup {
	pickers = {
		find_files = {
			hidden = true
		}
	},
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<space>gg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<space>bb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<space>hh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<space>ss', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope find symbols according lsp' })
vim.keymap.set('n', '<space>ee', builtin.diagnostics, { desc = 'Telescope find errors according lsp' })
