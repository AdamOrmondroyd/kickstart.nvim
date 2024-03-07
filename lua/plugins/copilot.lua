-- copilot
--
local function SuggestOneWord()
  local suggestion = vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  return vim.fn.split(bar,  [[[ .]\zs]])[1]
end

vim.keymap.set('i', '<C-\\>', SuggestOneWord, {expr = true, remap = false})
vim.g.copilot_filetypes = {markdown = true}

return {
    'github/copilot.vim',
}
