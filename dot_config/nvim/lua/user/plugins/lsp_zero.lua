local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then return end

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

lsp.preset('lsp-compe')
lsp.nvim_workspace()

lsp.ensure_installed({
  "sumneko_lua",
})

-- Format on save
local null_opts = lsp.build_options('null-ls', {
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = vim.lsp.buf.format,
      })
    end
  end
})


local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    diagnostics.eslint,
    formatting.prettier,
  }
})

lsp.configure('tsserver', {
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
  end
})

lsp.setup()

-- Configure mason
require('mason.settings').set({
  ui = { border = 'rounded' }
})

-- Override diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true
})
