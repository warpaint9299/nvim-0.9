local util = require("formatter.util");
local formatter = {
	require("formatter").setup {
	  -- Enable or disable logging
	  logging = true,
	  -- Set the log level
	  log_level = vim.log.levels.WARN,
		["*"] = {
		  -- "formatter.filetypes.any" defines default configurations for any
		  -- filetype
		  require("formatter.filetypes.any").remove_trailing_whitespace
		}
	  }
	}

return util;
