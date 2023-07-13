return {
  --                                 ╒═══════════╕
  --                                   autopairs
  --                                 ╘═══════════╛
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  --                                 ╒══════════╕
  --                                   barbecue
  --                                 ╘══════════╛
  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_modified = true,
      show_dirname = false,
      -- show_basename = true,
    },
    -- theme = "tokyonight",
  },

  --                                 ╒═══════════╕
  --                                   colorizer
  --                                 ╘═══════════╛
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- 'foreground' | 'background' | 'virtualtext'
        virtualtext = "■",
      },
    },
  },

  --                                  ╒════════╕
  --                                    colors
  --                                  ╘════════╛
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },

  --                                ╒═════════════╕
  --                                  comment-box
  --                                ╘═════════════╛
  {
    "LudoPinelli/comment-box.nvim",
  },

  --                                   ╒══════╕
  --                                     cybu
  --                                   ╘══════╛
  {
    "ghillb/cybu.nvim",
    branch = "main", -- timely updates
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- optional for icon support
    config = function()
      local ok, cybu = pcall(require, "cybu")
      if not ok then
        return
      end
      cybu.setup({
        position = {
          anchor = "topright",
        },
        style = {
          path = "tail",
        },
      })
      vim.keymap.set("n", "<C-o>", "<Plug>(CybuNext)")
    end,
  },

  --                                ╒════════════╕
  --                                  deadcolumn
  --                                ╘════════════╛
  {
    "Bekaboo/deadcolumn.nvim",
  },

  --                                   ╒══════╕
  --                                     dial
  --                                   ╘══════╛
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<A-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<A-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Decrement",
      },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      })
    end,
  },

  --                                 ╒══════════╕
  --                                   diffview
  --                                 ╘══════════╛
  {
    "sindrets/diffview.nvim",
  },

  --                                    ╒═════╕
  --                                      hop
  --                                    ╘═════╛
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({
        keys = "arstneioarstneioarstneio",
        jump_on_sole_occurrence = true,
      })
    end,
  },

  --                                  ╒═════════╕
  --                                    luasnip
  --                                  ╘═════════╛
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
      require("luasnip").filetype_extend("javascript", { "html" })
    end,
  },

  --                                  ╒═════════╕
  --                                    matchup
  --                                  ╘═════════╛
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },

  --                                   ╒═══════╕
  --                                     muren
  --                                   ╘═══════╛
  {
    "AckslD/muren.nvim",
    config = function()
      require("muren").setup({
        keys = {
          toggle_options_focus = "<C-f>",
        },
      })
    end,
  },

  --                                  ╒════════╕
  --                                    neodim
  --                                  ╘════════╛
  {
    "zbirenbaum/neodim",
    -- lazy = false,
    event = "LspAttach",
    config = function()
      require("neodim").setup({
        alpha = 0.5,
        blend_color = "#000000",
        update_in_insert = {
          enable = false,
          delay = 100,
        },
        hide = {
          virtual_text = true,
          signs = true,
          underline = true,
        },
      })
    end,
  },

  --                                 ╒═══════════╕
  --                                   neoscroll
  --                                 ╘═══════════╛
  {
    "karb94/neoscroll.nvim",
    config = function()
      local neoscroll = require("neoscroll")
      neoscroll.setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
      })
    end,
  },

  --                                   ╒═══════╕
  --                                     noice
  --                                   ╘═══════╛
  {
    "folke/noice.nvim",
    require("noice").setup({
      opts = {
        presets = {
          long_message_to_split = true,
          lsp_doc_border = {
            views = { hover = { border = { style = "rounded" }, position = { row = 1, col = 1 } } },
          },
        },
        lsp = {
          progress = {
            enabled = false,
          },
        },
        views = {
          mini = {
            enabled = false,
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "",
          },
          opts = { skip = true },
        },
      },
    }),
  },

  --                                 ╒═══════════╕
  --                                   scrollbar
  --                                 ╘═══════════╛
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      local colors = require("tokyonight.colors").setup()
      scrollbar.setup({
        handle = { color = colors.bg_highlight },
        excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
  },

  --                              ╒═════════════════╕
  --                                template-string
  --                              ╘═════════════════╛
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup({
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
        jsx_brackets = true, -- must add brackets to jsx attributes
        remove_template_string = false, -- remove backticks when there are no template string
        restore_quotes = {
          -- quotes used when "remove_template_string" option is enabled
          normal = [[']],
          jsx = [["]],
        },
      })
    end,
  },

  --                                  ╒═════════╕
  --                                    toggler
  --                                  ╘═════════╛
  {
    "nguyenvukhang/nvim-toggler",
    config = function()
      require("nvim-toggler").setup()
    end,
  },
  --                                ╒════════════╕
  --                                  ts-rainbow
  --                                ╘════════════╛

  {
    "HiPhish/nvim-ts-rainbow2",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          strategy = require("ts-rainbow.strategy.global"),
        },
      })
    end,
  },

  --                                 ╒═══════════╕
  --                                   typebreak
  --                                 ╘═══════════╛
  {
    "nagy135/typebreak.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      vim.keymap.set("n", "<leader>tb", require("typebreak").start, { desc = "Typebreak" })
    end,
  },

  --                                ╒════════════╕
  --                                  vim-prisma
  --                                ╘════════════╛
  {
    "prisma/vim-prisma",
  },

  --                               ╒══════════════╕
  --                                 visual-multi
  --                               ╘══════════════╛
  {
    "mg979/vim-visual-multi",
  },

  --                                 ╒═══════════╕
  --                                   which-key
  --                                 ╘═══════════╛
  {
    "folke/which-key.nvim",
    keys = {
      { "<leader><tab>", false },
    },
    opts = {
      window = {
        border = "rounded", -- none, single, double, shadow, rounded
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        -- winblend = 10,
      },
      layout = {
        align = "center", -- align columns left, center or right
      },
    },
  },
}
