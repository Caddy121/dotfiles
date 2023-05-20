lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = 'dashboard'
lvim.builtin.autopairs.active = true
lvim.builtin.breadcrumbs.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.cmp.cmdline.enable = false
lvim.builtin.cmp.window.documentation = true
lvim.colorscheme = 'everforest'

local cmp = require 'cmp'
local cmp_mapping = require 'cmp.config.mapping'
lvim.builtin.cmp.mapping['<TAB>'] = cmp_mapping.confirm { select = true }
lvim.builtin.cmp.mapping['<right>'] = cmp_mapping.confirm { select = false }
lvim.builtin.cmp.mapping['<C-e>'] = function()
  if cmp.visible() then
    return cmp.close()
  end
  cmp.complete()
end
lvim.builtin.cmp.window.documentation = {
  border = 'rounded',
  winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
}
lvim.builtin.cmp.window.completion = {
  border = 'rounded',
  winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
}
lvim.builtin.dap.active = true
lvim.builtin.illuminate.active = true
lvim.builtin.lualine.sections.lualine_c = {
  {
    "filename",
    path = 1,
    shorting_target = 40,
    symbols = { modified = "  ", readonly = "", unnamed = "" },
  }
}
lvim.builtin.nvimtree.active = false
lvim.builtin.terminal.active = false
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.which_key.mappings['e'] = {}
lvim.builtin.which_key.mappings['e'] = {
  { '<cmd>NeoTreeRevealToggle<cr>', 'Explorer' },
}
lvim.keys.insert_mode['<tab>'] = false
lvim.lsp.diagnostics.float.focusable = true
lvim.log.level = 'warn'
lvim.reload_config_on_save = false
-- lvim.builtin.cmp.mapping["<C-e>"] = function()
--   if cmp.visible() then
--     return cmp.close()
--   end
--   cmp.complete()
-- end,
-- lvim.builtin.cmp.formatting = {
--     format = require("tailwindcss-colorizer-cmp").formatter
-- }
vim.opt.showtabline = 0
vim.opt.relativenumber = true
vim.opt.backup = false                    -- creates a backup file
vim.opt.clipboard = 'unnamedplus'         -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                     -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { 'menu, menuone' } -- mostly just for cmp
vim.opt.conceallevel = 0                  -- so that `` is visible in markdown files
vim.opt.fileencoding = 'utf-8'            -- the encoding written to a file
vim.opt.hlsearch = true                   -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                 -- ignore case in search patterns
vim.opt.mouse = 'a'                       -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                    -- pop up menu height
vim.opt.showmode = false                  -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                   -- always show tabs
vim.opt.smartcase = true                  -- smart case
vim.opt.smartindent = true                -- make indenting smarter again
vim.opt.splitbelow = true                 -- force all horizontal splits to go below current window
vim.opt.splitright = true                 -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                  -- creates a swapfile
vim.opt.termguicolors = true              -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                   -- enable persistent undo
vim.opt.updatetime = 100                  -- faster completion (4000ms default)
vim.opt.writebackup = false               -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                  -- convert tabs to spaces
vim.opt.shiftwidth = 2                    -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                       -- insert 2 spaces for a tab
vim.opt.cursorline = true                 -- highlight the current line
vim.opt.number = true                     -- set numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.numberwidth = 4    -- set number column width to 2 {default 4}
vim.opt.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false       -- display lines as one long line
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = 'JetBrainsMono Nerd Font:h17' -- the font used in graphical neovim applications
vim.opt.title = true
-- colorcolumn = "80",
-- colorcolumn = "120",
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append {
  stl = ' ',
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.filetype.add {
  extension = {
    conf = 'dosini',
  },
}

-- lvim.builtin.nvimtree.setup.view.mappings.list = {
--   { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
--   { key = "h", action = "close_node" },
--   { key = "v", action = "vsplit" },
--   { key = "<C-k>", action = "" },
--   { key = "C", action = "cd" },
-- }
