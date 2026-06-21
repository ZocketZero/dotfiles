-- config for ejs
return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.filetype.add({
        extension = {
          ejs = "html",
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_install) == "table" then
        vim.list_extend(opts.ensure_install, { "html", "javascript" })
      end
      vim.treesitter.language.register("html", "ejs")
    end,
  },
}
