local neotest = require("neotest")

local go_config = { -- Specify configuration
  	go_test_args = {
    	"-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
  	},
	testify_enabled = true,
}
neotest.setup({
  adapters = {
    require("neotest-golang")(go_config), -- Apply configuration
  },
})
