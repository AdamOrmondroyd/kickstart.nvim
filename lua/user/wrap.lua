-- Enable text wrapping for certain filetypes

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
  pattern = { "markdown", "txt", "rst", "tex" },
  command = "setlocal wrap linebreak nolist",
  desc = "Enable text wrapping for markdown and txt files."
})

return {}
