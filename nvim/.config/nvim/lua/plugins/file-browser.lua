return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>sB",
      ":Telescope file_browser file_browser path=%:p:h=%:p:h<cr>",
      desc = "Browse Files",
    },
  },
  config = function(_, opts)
    print(vim.inspect(opts))
    require("telescope").load_extension("file_browser")
  end,
}
