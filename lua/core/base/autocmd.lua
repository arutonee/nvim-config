-- Filetypes
  -- GLSL
  vim.cmd('autocmd! BufNewFile,BufRead *.vsh,*.fsh set ft=glsl')

-- 4-space tabs
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'python',
    'rust'
  },
  command = [[
    setlocal tabstop=4
    setlocal shiftwidth=4
  ]]
})

-- Rulers
  -- Python
  vim.cmd('autocmd! FileType python set colorcolumn=80')
