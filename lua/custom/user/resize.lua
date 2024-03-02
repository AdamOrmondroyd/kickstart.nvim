-- Automactically resize windows on terminal resize
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("WinResize", {clear = true}),
  pattern = "*",
  command = "wincmd =",
  desc = "Resize windows on terminal resize."
})

return {}
