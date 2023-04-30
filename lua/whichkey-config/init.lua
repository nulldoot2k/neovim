local wk = require("which-key")
wk.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true
    }
  }
}

operators = { gc = "Comments" }
icons = {
  breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
  separator = "➜", -- symbol used between a key and it's label
  group = "+", -- symbol prepended to a group
}
window = {
  border = "none", -- none, single, double, shadow
  position = "bottom", -- bottom, top
  margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
  padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  winblend = 0
}
layout = {
  height = { min = 4, max = 25 }, -- min and max height of the columns
  width = { min = 20, max = 50 }, -- min and max width of the columns
  spacing = 3, -- spacing between columns
  align = "left", -- align columns left, center or right
}
ignore_missing = false -- enable this to hide mappings for which you didn't specify a label
hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " } -- hide mapping boilerplate
show_help = true -- show help message on the command line when the popup is visible
triggers = "auto" -- automatically setup triggers

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ cmd = "pwsh", direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end

local mappings = {
  f = {
    name = "Files!!!",
    f = { ":Telescope find_files <cr>", "Telescope Find Files" },
    r = { ":Telescope live_grep <cr>", "Telescope Live Grep" },
    o = { ":Telescope oldfiles <cr>", "Open Recent File" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    n = { ":enew <cr>", "Create A New File" },
  },
  t = {
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float, "Floating Terminal" },
    l = { toggle_lazygit, "LazyGit" }
  },
  o = {
    name = "Options!!!",
    q = { ":q<cr>", "Quit" },
    Q = { ":wq<cr>", "Save & Quit" },
    w = { ":w<cr>", "Save" },
    x = { ":bdelete<cr>", "Close" },
    E = { ":e ~/AppData/Local/nvim/init.lua<cr>", "Edit config" },
  },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
    R = { '<cmd>Lspsaga rename<cr>', "Rename" },
    a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
    e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
    n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
    N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" }
  },
  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  },
  m = {
    name = "Markdown Preview",
    g = { ":MarkdownPreview github<CR>", "Theme Github" },
    d = { ":MarkdownPreview solarized-dark<CR>", "Theme Dark" },
    l = { ":MarkdownPreview solarized-light<CR>", "Theme Light" },
  }
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
