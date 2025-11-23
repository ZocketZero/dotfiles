-- setup mason
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        --  mason auto nstall here
        "css-lsp",
        "html-lsp",
        "prettier",
      },
    },
  },
}
