local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end

local tactions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = tactions.close,
      },
    },
  }
})

telescope.load_extension('fzf')

-- Create Rg command
vim.api.nvim_create_user_command("Rg", function(opts) require("telescope.builtin").grep_string({ search = opts.args }) end, { nargs = "+" })
