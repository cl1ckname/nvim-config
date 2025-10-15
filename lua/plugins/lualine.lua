local line = require('lualine')

local CTimeLine = require('lualine.component'):extend()

CTimeLine.init = function(self, options)
	CTimeLine.super.init(self, options)
end

CTimeLine.update_status = function(self)
    return os.date(self.options.format or "%H:%M:%S", os.time())
end


line.setup({
	options = {
	icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {'nerdtree', 'neo-tree', 'dashboard'},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location', CTimeLine}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {CTimeLine}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
