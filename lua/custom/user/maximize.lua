-- Maximize current buffer

function MaximizeToggle()
  -- Close nvim-tree if it's open
  require('nvim-tree.api').tree.close()

  if vim.g.maximize_session then
    vim.cmd('source ' .. vim.g.maximize_session)
    os.remove(vim.g.maximize_session)
    vim.g.maximize_session = nil
    vim.o.hidden = vim.g.maximize_hidden_save
    vim.g.maximize_hidden_save = nil
  else
    vim.g.maximize_hidden_save = vim.o.hidden
    vim.g.maximize_session = vim.fn.tempname()
    vim.o.hidden = true
    vim.cmd('mksession! ' .. vim.g.maximize_session)
    vim.cmd('only')
  end
end

vim.keymap.set('n', '<leader>z', MaximizeToggle, {desc = 'maximi[Z]e'})
