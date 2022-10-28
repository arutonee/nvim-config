vim.cmd([[
  filetype plugin on
  syntax on

" Appearance
  set termguicolors
  set showcmd
  set number
  set relativenumber
  set nohlsearch
  set nowrap

" Encoding
  set encoding=UTF-8
  set fileformat=unix
  set fileformats=unix,dos

" Behavior
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set autoindent
  set ignorecase
  set smartcase
  set scrolloff=10
  set sidescroll=40

" History
  set noswapfile
  set nobackup
  set history=10
  set scrollback=1000

  nnoremap <C-r> :source $MYVIMRC<CR>
]])

-- 4-space tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "rust" },
  command = [[
    set tabstop=4
    set shiftwidth=4
  ]]
})


if (vim.loop.os_uname().sysname == "Windows_NT") then
end
