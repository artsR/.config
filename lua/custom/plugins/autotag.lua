local status_ok, autotag = pcall(require, 'nvim-ts-autotag')

if status_ok then
  autotag.setup {}
end
