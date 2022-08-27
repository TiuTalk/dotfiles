local status_ok, plugin = pcall(require, "gitblame")
if not status_ok then return end

vim.g.gitblame_enabled = false
vim.g.gitblame_message_template = '<sha> - <date> - <author> - <summary>'
vim.g.gitblame_date_format = '%r'
