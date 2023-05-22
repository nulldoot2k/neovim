local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
  ensure_installed = { 
    "go",  
  },

  sync_install = false,
  auto_install = true,

  ignore_install = { "kotin", "julia" },

  highlight = {
    enable = true,

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
  rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
  autotag = { enable = true }, -- config autotag
	incremental_selection = { enable = true },
	indent = { enable = true },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
