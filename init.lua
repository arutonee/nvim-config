local colorscheme = "tomorrow-night"
local colorscheme_file_name = os.getenv("HOME") .. "/.nvim_colorscheme"
local colorscheme_file_object = io.open(colorscheme_file_name, "rb")
if colorscheme_file_object then
  colorscheme = colorscheme_file_object:read("*a")
  colorscheme_file_object:close()
else
  colorscheme_file_object = io.open(colorscheme_file_name, "w")
  colorscheme_file_object:write(colorscheme)
  colorscheme_file_object:close()
end

vim.cmd(string.format([[
  call plug#begin()
  Plug 'tpope/vim-commentary'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'andweeb/presence.nvim'
  Plug 'smjonas/inc-rename.nvim'
  call plug#end()

  filetype plugin on
  syntax on

" Appearance
  colorscheme %s
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
  set omnifunc=syntaxcomplete#Complete
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set autoindent
  set autowrite
  set ignorecase
  set smartcase
  set scrolloff=10
  set sidescroll=40
  set mouse=a

" History
  set noswapfile
  set nobackup
  set history=10
  set scrollback=1000

  nnoremap <C-d> :tabnext<CR>
  nnoremap <C-a> :tabprevious<CR>
  nnoremap <C-e> :tabmove +1<CR>
  nnoremap <C-q> :tabmove -1<CR>

  nnoremap <C-s> :wa<CR>

  nnoremap <C-o> :vs<CR><C-w>l:Ex .<CR>
  nnoremap <C-h> :sp<CR><C-w>j:Ex .<CR>

  nnoremap <C-t> :tabe<CR>

  nnoremap <C-f> <Nop>
  nnoremap <C-f>f :Files<CR>
  nnoremap <C-f>c :Colors<CR>
  nnoremap <C-f>b :Buffers<CR>

  nnoremap <C-n> :vertical resize -1<CR>
  nnoremap <C-k> :vertical resize +1<CR>
  nnoremap <C-u> <C-w>+
  nnoremap <C-i> <C-w>-

  tnoremap <Esc> <C-\><C-n>

  nnoremap j gj
  nnoremap k gk


  function! CleanNoNameEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
      exe 'bd '.join(buffers, ' ')
    else
      echo 'No buffer deleted'
    endif
  endfunction

  nnoremap <silent> ,C :call CleanNoNameEmptyBuffers()<CR>
]], colorscheme))

-- 4-space tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "rust" },
  command = [[
    setlocal tabstop=4
    setlocal shiftwidth=4
  ]]
})

-- Coconut-lang files (.coc)
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = { "*.coc" },
  command = [[
    set syntax=python
  ]]
})


vim.api.nvim_create_autocmd("ColorScheme", {
  command = [[
    highlight IndentBlanklineIndent1 guifg=#eb6f92 gui=nocombine
    highlight IndentBlanklineIndent2 guifg=#f6c177 gui=nocombine
    highlight IndentBlanklineIndent3 guifg=#9ccfd8 gui=nocombine
    highlight IndentBlanklineIndent4 guifg=#31748f gui=nocombine
    highlight IndentBlanklineIndent5 guifg=#c4a7e7 gui=nocombine
  ]]
})

vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitelines_at_eof = 1
vim.g.fzf_preview_window = {}


vim.cmd [[highlight IndentBlanklineIndent1 guifg=#eb6f92 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#f6c177 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#9ccfd8 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#31748f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#c4a7e7 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
  },
}

-- LSP
require('lspconfig').pyright.setup{}
require('lspconfig').jdtls.setup{}

-- LSP IncRename
require('inc_rename').setup()

-- Discord Rich Presence
require('presence'):setup({
  neovim_image_text   = "https://neovim.io/",
  main_image          = "file", -- "neovim", "file"
  buttons             = false
})

if (vim.loop.os_uname().sysname == "Windows_NT") then
end
