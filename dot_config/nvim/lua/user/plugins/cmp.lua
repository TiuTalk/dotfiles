local status_ok, cmp = pcall(require, "cmp")
if not status_ok then return end

local lspkind = require("lspkind")

lspkind.init({
  symbol_map = {
    Copilot = "",
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  sources = cmp.config.sources({
    { name = 'copilot', group_index = 2 },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'buffer', keyword_length = 3, option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end } },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
  }, {
    { name = 'buffer' },
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),
  }),
  window = {
    documentation = vim.tbl_deep_extend('force', cmp.config.window.bordered(), {
      max_height = 15,
      max_width = 60,
    })
  },
  -- formatting = {
  --   fields = { 'menu', 'abbr', 'kind' }
  -- },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
    })
  }
})
