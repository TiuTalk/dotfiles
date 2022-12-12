local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then return end

-- Configure lsp_installer
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.setup({
  ensure_installed = { "sumneko_lua" },
})

-- Configure lspconfig
local servers = lsp_installer.get_installed_servers()
local illuminate = require("illuminate")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local opts = {
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    illuminate.on_attach(client)

    -- Disable formatting through LSP
    client.server_capabilities.documentFormattingProvider = false

    vim.api.nvim_create_autocmd("BufWritePre", { command = [[Format]], buffer = bufnr })
  end,
}

for _, server in pairs(servers) do
  local has_custom_opts, server_custom_opts = pcall(require, "user/plugins/lsp_config/" .. server.name)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  lspconfig[server.name].setup(opts)
end

-- Configure null-ls
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({ generator_opts = { cmd = "yarn prettier" } })
  },
})
