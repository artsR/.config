local status, nvim_colorizer = pcall(require, 'colorizer')
if not status then return end

nvim_colorizer.setup()

