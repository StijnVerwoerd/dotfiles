-- remaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map <leader> to :ZenMode
map('n', '<leader>z', '<cmd>ZenMode<CR>', opts)

-- Map <leader> to open the LSP diagnostics on that line
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics under cursor' })

-- Map 'Enter' to open a new empty line below
vim.keymap.set('n', '<CR>', 'o<Esc>', { noremap = true, silent = true })
