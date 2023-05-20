lvim.plugins = {
  'ellisonleao/gruvbox.nvim',
  'LunarVim/synthwave84.nvim',
  'roobert/tailwindcss-colorizer-cmp.nvim',
  'lunarvim/github.nvim',
  -- "nvim-treesitter/playground",
  -- "nvim-treesitter/nvim-treesitter-textobjects",
  'mfussenegger/nvim-jdtls',
  'karb94/neoscroll.nvim',
  -- "christianchiarulli/nvim-ts-autotag",
  'echasnovski/mini.surround',
  'ghillb/cybu.nvim',
  'moll/vim-bbye',
  'folke/todo-comments.nvim',
  'windwp/nvim-spectre',
  'f-person/git-blame.nvim',
  'lvimuser/lsp-inlayhints.nvim',
  'lunarvim/darkplus.nvim',
  'TimUntersberger/neogit',
  'sindrets/diffview.nvim',
  'jose-elias-alvarez/typescript.nvim',
  'mxsdev/nvim-dap-vscode-js',
  'petertriho/nvim-scrollbar',
  'LudoPinelli/comment-box.nvim',
  'Bekaboo/deadcolumn.nvim',
  'prisma/vim-prisma',
  'mg979/vim-visual-multi',
  'sainnhe/everforest',
  "rafamadriz/friendly-snippets",
  {
    'saecki/crates.nvim',
    version = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup {
        null_ls = {
          enabled = true,
          name = 'crates.nvim',
        },
      }
    end,
  },
  'MunifTanjim/nui.nvim',
  -- "jackMort/ChatGPT.nvim",
  -- {
  --   "jinh0/eyeliner.nvim",
  --   config = function()
  --     require("eyeliner").setup {
  --       highlight_on_key = true,
  --     }
  --   end,
  -- },
  { 'christianchiarulli/telescope-tabs', branch = 'chris' },
  'monaqa/dial.nvim',
  {
    '0x100101/lab.nvim',
    build = 'cd js && npm ci',
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   -- cmd = "Copilot",
  --   event = "InsertEnter",
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  {
    'tzachar/cmp-tabnine',
    event = 'InsertEnter',
    build = './install.sh',
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'utilyre/barbecue.nvim',
    version = '*',
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      show_modified = true,
      show_dirname = false,
      -- show_basename = true,
    },
    -- theme = "tokyonight",
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      filetypes = { '*', '!lazy' },
      buftype = { '*', '!prompt', '!nofile' },
      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = true,        -- "Name" codes like Blue
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        AARRGGBB = true,     -- 0xAARRGGBB hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = true,       -- CSS hsl() and hsla() functions
        css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = 'background', -- 'foreground' | 'background' | 'virtualtext'
        virtualtext = '■',
      },
    },
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup {
        keys = 'arstneioarstneioarstneio',
        jump_on_sole_occurrence = true,
      }
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets' }
      require('luasnip').filetype_extend('javascript', { 'javascriptreact' })
      require('luasnip').filetype_extend('javascript', { 'html' })
    end,
  },
  {
    'AckslD/muren.nvim',
    config = function()
      require('muren').setup {
        keys = {
          toggle_options_focus = '<C-f>',
        },
      }
    end,
  },
  {
    'axelvc/template-string.nvim',
    config = function()
      require('template-string').setup {
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }, -- filetypes where the plugin is active
        jsx_brackets = true,                                                                        -- must add brackets to jsx attributes
        remove_template_string = false,                                                             -- remove backticks when there are no template string
        restore_quotes = {
          -- quotes used when "remove_template_string" option is enabled
          normal = [[']],
          jsx = [["]],
        },
      }
    end,
  },
  {
    'nguyenvukhang/nvim-toggler',
    config = function()
      require('nvim-toggler').setup()
    end,
  },
  {
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        separator_style = 'slope',
        show_close_icon = false,
        show_buffer_close_icons = false,
        indicator = {
          style = 'none',
        },
        highlights = {
          buffer_selected = { italic = false },
        },
        offsets = {
          {
            filetype = 'NeoTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        config = function()
          require('window-picker').setup {
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', 'quickfix' },
              },
            },
            other_win_hl_color = '#e35e4f',
          }
        end,
      },
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
      -- NOTE: this is changed from v1.x, which used the old style of highlight groups
      -- in the form "LspDiagnosticsSignWarning"
    end,
  },

  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  -- },

  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
}
