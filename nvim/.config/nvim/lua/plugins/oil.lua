return {
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}

