nm('<C-b>', ':Neotree toggle last<CR>')
nm('<leader>ll', ':BufferLinePick<CR>')
nm('<S-Tab>', ':dl<CR>')
nm('<leader>lk', ':dr<CR>')
nm('<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>')
nm('<leader>w', ':BufferLineCloseOthers<CR>:bp<bar>sp<bar>bn<bar>bd<CR>')

nm('<leader>tc', ':GoTest -n<CR>')
nm('<leader>tf', ':GoTest -f<CR>')
nm('<leader>tp', ':GoTest -p<CR>')
nm('<C-L>', ':GoImports<CR>')

nm('<space>vc', ':Gitsigns preview_hunk<CR>')
nm('<space>vd', ':Gitsigns toggle_deleted<CR>')

nm('<space>gd', '<cmd>Glance defenitions<cr>')
nm('<space>gr', '<cmd>Glance references<cr>')

-- vim.api.nvim_create_autocmd({ "TermEnter" }, {
-- 	callback = function()
-- 		vim.cmd('startinsert')
-- 	end
-- })
