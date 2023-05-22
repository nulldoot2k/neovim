-- main
require("datv.plugins")
require("datv.options")
require("datv.maps")

-- env
vim.cmd([[
let s:node_host_prog = expand('$APPDATA\npm\node_modules\neovim\bin\cli.js')
if filereadable(fnameescape(s:node_host_prog))
  let g:node_host_prog = fnameescape(s:node_host_prog)
else
  unlet! g:node_host_prog
endif
]])

local function init_globals()
	vim.g.python3_host_prog = "C:\\Users\\Asus\\scoop\\shims\\python3.exe"
	vim.g.ruby_host_prog = "C:\\Ruby32-x64\\bin\\ruby.exe"
	vim.g.loaded_perl_provider = 0
end

vim.cmd([[let g:formatprg = 'stylua --indent-type Spaces --indent-width 2 -']])
init_globals()

vim.cmd[[
if executable('gopls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
endif
]]
