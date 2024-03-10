-- Keymaps

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>;', ';', { noremap = true, desc = 'Repeat fFtT' })
vim.keymap.set('n', ';', '<C-w>', { noremap = true })

-- Terminal mode escape insert mode
vim.keymap.set('t', '<esc>', '<C-\\><C-N>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- See `:help telescope.builtin`
-- diff shortcuts
vim.keymap.set('n', 'gv', '<cmd>Gvdiffsplit<cr>', { desc = '[G]it [V]diffsplit (normal mode)' })
vim.keymap.set('n', '<leader>gv', '<cmd>Gvdiffsplit<cr>', { desc = '[G]it [V]diffsplit' })
vim.keymap.set('n', '<leader>dgb', '<cmd>diffget BASE<cr>', { desc = '[D]iff [G]et [B]ASE' })
vim.keymap.set('n', '<leader>dgl', '<cmd>diffget LOCAL<cr>', { desc = '[D]iff [G]et [L]OCAL' })
vim.keymap.set('n', '<leader>dgr', '<cmd>diffget REMOTE<cr>', { desc = '[D]iff [G]et [R]EMOTE' })

-- Open and close new tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = '[T]ab [N]ew' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = '[T]ab [C]lose' })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- document existing key chains
require('which-key').register {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument/[D]iff', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename/[R]estore', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]ree/[T]ab', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
  ['<leader>'] = { name = 'VISUAL <leader>' },
  ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })

return {}
