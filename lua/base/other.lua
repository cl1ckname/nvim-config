local opt = vim.opt
--[[ Настройка панелей ]] --
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели. Данная настройка поможет нам держать панели в порядке
opt.splitright = true

-- Горизонтальные сплиты становятся снизу
opt.splitbelow = true

--[[ Дополнительные настройки ]] --
-- Используем системный буфер обмена
opt.clipboard = 'unnamedplus'

-- Отключаем дополнение файлов в конце
opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
opt.completeopt = 'longest'

opt.relativenumber = true
opt.number = true
-- vim.opt.statuscolumn = '%#NonText#%{v:lnum} %=%{v:relnum}'
vim.opt.statuscolumn = '%s %l %r'
opt.foldlevel = 100

--opt.colorcolumn = 140
--opt.number = true
-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

vim.cmd([[
	set termguicolors
	set foldmethod=indent
	colorscheme kanagawa
	set colorcolumn=140
]])


vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
opt.exrc = true

