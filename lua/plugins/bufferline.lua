local buf = require('bufferline')

buf.setup {
	options = {
		mode = "buffers",
		offsets = {
			{
				filetype = "nerdtree",
				text = "Explorer",
				highlight = "Directory",
				separator = true,
			},
			{
				filetype = "neo-tree",
				text = "Explorer",
				highlight = "Directory",
				separator = true,
			}
		},
	}
}
