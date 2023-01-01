-- Set the default colorscheme
local colorscheme = 'tomorrow-night'
local colorscheme_file_name = os.getenv('HOME') .. '/.nvim_colorscheme'
local colorscheme_file_object = io.open(colorscheme_file_name, 'rb')
if colorscheme_file_object then
  -- Set the colorscheme to the one mentioned in the file
  colorscheme = colorscheme_file_object:read('*a')
  colorscheme_file_object:close()
else
  -- If the file does not exist, write the default colorscheme to it
  colorscheme_file_object = io.open(colorscheme_file_name, 'w')
  colorscheme_file_object:write(colorscheme)
  colorscheme_file_object:close()
end

vim.cmd('colorscheme ' .. colorscheme)
vim.opt.termguicolors = true
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.wrap = false
