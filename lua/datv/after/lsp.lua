local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig/util")

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
