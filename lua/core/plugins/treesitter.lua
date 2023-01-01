require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'css',
    'glsl',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'python',
    'regex',
    'rust',
    'scss',
    'toml',
    'typescript',
    'vim'
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}
