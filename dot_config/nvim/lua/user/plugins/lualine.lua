local status_ok, plugin = pcall(require, "lualine")
if not status_ok then return end

plugin.setup({})
