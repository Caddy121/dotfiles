return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ignore_install = { "help" }

    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "cmake",
        "css",
        "diff",
        "gitignore",
        "graphql",
        "help",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "norg",
        "org",
        "python",
        "query",
        "regex",
        "scss",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "json",
      })
    end
  end,
}
