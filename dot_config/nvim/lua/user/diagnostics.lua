local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

local icon = {
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = ''
}

sign({ name = 'DiagnosticSignError', text = icon.error })
sign({ name = 'DiagnosticSignWarn', text = icon.warn })
sign({ name = 'DiagnosticSignHint', text = icon.hint })
sign({ name = 'DiagnosticSignInfo', text = icon.info })

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  severity_sort = true,
  float = false,
  underline = false,
})
