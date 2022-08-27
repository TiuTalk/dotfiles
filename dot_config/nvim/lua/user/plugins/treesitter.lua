local status_ok, plugin = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

plugin.setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true
  }
})
