nm("<C-b>", ":Neotree toggle last<CR>")
nm("<space>l", ":BufferLinePick<CR>")
nm("<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>")
nm("<leader>w", ":BufferLineCloseOthers<CR>:bp<bar>sp<bar>bn<bar>bd<CR>")

nm("<leader>tc", ":GoTest -n<CR>")
nm("<leader>tf", ":GoTest -f<CR>")
nm("<leader>tp", ":GoTest -p<CR>")
nm("<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>")
nm("<leader>tS", "<cmd>lua require('neotest').output_panel.toggle()<CR>")
nm("<C-L>", ":GoImports<CR>")

nm("<space>vc", ":Gitsigns preview_hunk<CR>")
nm("<space>vd", ":Gitsigns toggle_deleted<CR>")

im("<leader>se", "<cmd>Emoji<cr>")
im("<leader>sk", "<cmd>KaomojiInsertByGroup<cr>")
