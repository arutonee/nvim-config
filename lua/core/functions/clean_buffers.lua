vim.cmd([[
  function! CleanNoNameEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
      exe 'bd '.join(buffers, ' ')
    else
      echo 'No buffer deleted'
    endif
  endfunction
]])

vim.keymap.set('n', '<leader>C', ':call CleanNoNameEmptyBuffers()<CR>')
