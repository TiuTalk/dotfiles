local nvim_create_autocmd = vim.api.nvim_create_autocmd
local nvim_create_user_command = vim.api.nvim_create_user_command

nvim_create_user_command('Format', function()
  vim.lsp.buf.formatting_sync(nil, 2000)
end, {})

nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
