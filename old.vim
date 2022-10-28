set nocompatible
filetype off
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme rose-pine-dark

lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pyright.setup{}

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#eb6f92 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#f6c177 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#9ccfd8 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#31748f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#c4a7e7 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:•")
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
EOF

let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1

filetype plugin indent on
syntax on

hi TabLine guifg=#e0def4 guibg=#706e86 gui=NONE

set updatecount=0
set nohlsearch
set termguicolors
set history=10
set updatetime=1000
set scrollback=1000
set foldtext=
set showcmd
set showbreak=++++
set mouse=a
set encoding=UTF-8
set ttimeoutlen=0
set laststatus=2
set number
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autowrite
set autoindent
set ignorecase
set smartcase
set nobackup
set expandtab
set scrolloff=10
set sidescroll=40
set foldmethod=indent
set nofoldenable
set fileformats=unix,dos

tnoremap <Esc> <C-\><C-n>
tnoremap <C-k> <C-\><C-n>:bd!<CR>
nnoremap <Space> :tabe<CR>:term<CR>i

" Control+s to tab backwards
nnoremap <C-s> :<C-u>tabnext<CR>
inoremap <C-s> <C-\><C-n>:tabnext<CR>
vnoremap <C-s> <C-\><C-n>:tabnext<CR>
" Control+a to tab forwards
nnoremap <C-a> :<C-U>tabprevious<CR>
inoremap <C-a> <C-\><C-n>:tabprevious<CR>
vnoremap <C-a> <C-\><C-n>:tabprevious<CR>

nnoremap <C-e> :<C-u>tabmove +1<CR>
nnoremap <C-q> :<C-u>tabmove -1<CR>

nnoremap <C-t> :tabe<CR>

nnoremap <C-o> :tabe<CR>:Ex .<CR>

nnoremap <C-k> :wa<CR>:sp<bar>term sh ./.g.vimrun.vimrun<CR><C-w>J:resize 10<CR>
nnoremap <C-l> :wa<CR>:sp<bar>term sh "%:p:h"/."%:t".vimrun<CR><C-w>J:resize 10<CR>
nnoremap <C-f> :!touch "%:p:h"/."%:t".vimrun && chmod +x "%:p:h"/."%:t".vimrun<CR>

set omnifunc=syntaxcomplete#Complete

autocmd Filetype python setlocal
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ expandtab
      \ autoindent
autocmd Filetype rust setlocal
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ expandtab
      \ autoindent
