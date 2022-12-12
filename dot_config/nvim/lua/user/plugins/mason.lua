-- mason
local status_ok, mason = pcall(require, "mason")
if not status_ok then return end

mason.setup()

-- mason-lspconfig
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then return end

mason_lspconfig.setup({
  ensure_installed = { "sumneko_lua" },
  automatic_installation = true,
})

-- lspconfig
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then return end

-- cmp_nvim_lsp
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_defaults = vim.tbl_deep_extend('force', lspconfig.util.default_config, {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            timeout_ms = 1000,
            bufnr = bufnr,
            filter = function(client)
              return client.name == "null-ls"
            end,
          })
        end,
      })
    end

    -- Disable document formatting globally
    -- client.server_capabilities.documentFormattingProvider = false

    -- Format on save
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   -- buffer = bufnr
    --   pattern = { "*.js,*.jsx,*.exs" },
    --   callback = function()
    --     vim.lsp.buf.format({ timeout_ms = 500, async = false })
    --   end,
    -- })
  end
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = lsp_defaults

    local has_custom_opts, server_custom_opts = pcall(require, "user/plugins/lsp_config/" .. server_name)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    lspconfig[server_name].setup(opts)
  end,
})

-- null_ls
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    -- JS
    diagnostics.eslint,
    formatting.prettier,

    -- Elixir
    diagnostics.credo,
    formatting.mix,
  },
})
