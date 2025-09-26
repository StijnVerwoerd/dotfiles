-- remaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map <leader> + z to :ZenMode
map('n', '<leader>z', '<cmd>ZenMode<CR>', opts)

-- Map <leader> + n to open the LSP diagnostics on that line
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics under cursor' })

-- Map 'Enter' to open a new empty line below
map('n', '<CR>', 'o<Esc>', opts)
