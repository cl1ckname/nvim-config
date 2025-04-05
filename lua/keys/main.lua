require('keys/aliases')
require('keys/plugins')
require('keys/telescope')

im('<C-h>', '<Left>')
im('<C-l>', '<Right>')
im('<C-j>', '<Down>')
im('<C-k>', '<Up>')
im('jj', '<ESC>')

nm('<C-q>', ':wq<CR>')
nm('<S-k>', '<cmd>lua vim.lsp.buf.hover<CR>')

nm('hr', ':source $HOME/.config/nvim/init.lua<CR>')
-- tm('<C-t>', '<C-\\><C-n>:ToggleTerm<CR>')
local exitTerm = function()
	vim.cmd(":ToggleTerm");
end
vim.keymap.set("t", "<C-t>", exitTerm)
nm('<C-t>', ':ToggleTerm direction=float<CR>')
nm('gf', ':lua vim.lsp.buf.format()<CR>')

nm('G', 'Gzz')
nm('}', '}zz')
nm('{', '{zz')

im('{{', '{}<left>')
im('{<CR>', '{<CR>}<left><CR><up><Tab>')

nm('<C-n><C-h>', '<cmd>noh<CR>')
nm('<C-w><C-f>', '<cmd>on<CR><cmd>vs<CR><C-w>h')
