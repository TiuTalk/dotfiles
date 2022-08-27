local status_ok, plugin = pcall(require, "bufferline")
if not status_ok then
	return
end

plugin.setup({})
