local status_ok, plugin = pcall(require, "nvim-autopairs")
if not status_ok then return end

plugin.setup({
  check_ts = true,
  map_cr = false,
  disable_filetype = { "TelescopePrompt" },
})

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
