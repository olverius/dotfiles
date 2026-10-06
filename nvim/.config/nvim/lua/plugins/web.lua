-- HTML / CSS / JS support for LazyVim
-- Location: ~/.config/nvim/lua/plugins/web.lua
return {
  -- Language servers: completion, errors, hover docs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},                  -- HTML tags & attributes
        cssls = {},                 -- CSS properties & values
        emmet_language_server = {}, -- type "ul>li*3" + Enter -> expands to full HTML
      },
    },
  },

  -- Syntax highlighting parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "html", "css", "javascript" })
    end,
  },
}
