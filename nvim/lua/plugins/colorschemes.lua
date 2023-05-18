return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
  --                     ╒═══════════════════════════════════╕
  --                       colorschemes with default configs
  --                     ╘═══════════════════════════════════╛
  { "Mofiqul/dracula.nvim", enabled = true },
  { "sainnhe/edge", enabled = true },
  { "sainnhe/everforest", enabled = true },
  { "sainnhe/gruvbox-material", enabled = true },
  { "lunarvim/horizon.nvim", enabled = true },
  { "Shatur/neovim-ayu", enabled = true },
  { "cpea2506/one_monokai.nvim", enabled = true },
  { "nyoom-engineering/oxocarbon.nvim" },
  -- { "rebelot/kanagawa", enabled = true },
  -- { "olimorris/onedarkpro", enabled = true },
  --                      ╒════════════════════════════════╕
  --                        colorschemes with user configs
  --                      ╘════════════════════════════════╛
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("bluloco").setup({
        style = "dark", -- "auto" | "dark" | "light"
        transparent = true,
        italics = true,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("everforest").setup({
  --       background = "hard", -- hardness of background. "soft" | "medium" | "hard"
  --       transparent_background_level = 0, -- "0" | "1" | "2"
  --       italics = true,
  --       disable_italic_comments = false,
  --     })
  --   end,
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    config = function()
      require("gruvbox").setup({
        invert_selection = true,
      })
    end,
  },
  {
    "marko-cerovac/material.nvim",
    enabled = true,
    config = function()
      require("material").setup({
        styles = {
          types = { italic = true },
          keywords = { italic = true },
          variables = { italic = true },
          fields = { italic = true },
        },
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = true,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            types = "italic",
            keywords = "bold",
            variables = "italic",
          },
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon",
        -- dim_nc_background = true,
        -- disable_background = true,
        -- disable_float_background = true,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
  },
}
