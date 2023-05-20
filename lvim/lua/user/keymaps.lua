M = {}
lvim.leader = 'space'

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Move to window using <ctrl> hjkl keys
keymap('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Window Splits
keymap('n', '<leader>wd', '<C-W>c', { desc = 'Delete window' })
keymap('n', '<leader>wv', '<C-W>s', { desc = 'Split window below' })
keymap('n', '<leader>wh', '<C-W>v', { desc = 'Split window right' })

-- Quit/Save
keymap('n', '<C-q>', ':q! <cr>', { desc = 'Quit' })
keymap('n', '<C-w>', ':w <cr>', { desc = 'Save' })

-- Paste without yanking
keymap('v', 'p', '"_dP', { desc = 'Paste over selection without yanking' })

-- Delete word backward
keymap('i', '<A-BS>', '<c-w>', { desc = 'Delete word backward' })

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

-- Move Lines
keymap('n', 'E', ":m '>+1<CR>gv-gv", { desc = 'Move down' })
keymap('v', 'E', ":m '>+1<CR>gv-gv", { desc = 'Move down' })
keymap('n', 'U', ":m '<-2<CR>gv-gv", { desc = 'Move up' })
keymap('v', 'U', ":m '<-2<CR>gv-gv", { desc = 'Move up' })

-- Center
keymap('n', 'n', 'nzz')
keymap('n', 'N', 'Nzz')
keymap('n', '*', '*zz')
keymap('n', '#', '#zz')
keymap('n', 'g*', 'g*zz')
keymap('n', 'g#', 'g#zz')

-- Buffers
keymap('n', 'bp', '<cmd>Telescope buffers<cr>', { desc = 'Select Buffers' })
-- keymap("n", "<leader>bo", "<cmd>BufferCloseAllButVisible<CR>")

-- Move to previous/next
keymap('n', '<C-tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)
keymap('n', '<tab>', '<Cmd>BufferLineCycleNext<CR>', opts)

-- Re-order to previous/next
keymap('n', '<A-,>', '<Cmd>BufferLineMovePrev<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferLineMoveNext<CR>', opts)

-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLineGoToBuffer -1<CR>', opts)

-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferlineTogglePin<CR>', opts)

-- Magic buffer-picking mode
keymap('n', '<C-p>', '<Cmd>BufferLinePick<CR>', opts)

-- Sort automatically by...
keymap('n', '<Space>bd', '<Cmd>BufferLineSortByDirectory<CR>', { desc = 'Sort by Directory' }, opts)

-- Comment Box
keymap('n', '<leader>tt', '<cmd>:CBacbox21<cr>')
keymap('v', '<leader>tt', '<cmd>:CBacbox21<cr>')

-- Neovide
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

-- Hop
keymap(
  'n',
  'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<CR>",
  {
    noremap = true,
    silent = true,
  }
)
keymap(
  'n',
  'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<CR>",
  {
    noremap = true,
    silent = true,
  }
)
keymap(
  'n',
  't',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<CR>",
  {
    noremap = true,
    silent = true,
  }
)
keymap(
  'n',
  'T',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<CR>",
  {
    noremap = true,
    silent = true,
  }
)
keymap(
  'o',
  'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<CR>",
  {
    noremap = true,
    silent = true,
  }
)
keymap(
  'o',
  'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<CR>",
  {
    noremap = true,
    silent = true,
  }
)
keymap(
  'o',
  't',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<CR>",
  {
    noremap = true,
    silent = true,
  }
)
keymap(
  'o',
  'T',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<CR>",
  {
    noremap = true,
    silent = true,
  }
)

return M
