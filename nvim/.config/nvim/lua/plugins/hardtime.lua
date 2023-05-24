return {
  {
    "m4xshen/hardtime.nvim",
    opts = {
      max_time = 1000,
      max_count = 2,
      disable_mouse = true,
      hint = true,
      allow_different_key = false,
      resetting_keys = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "c", "d" },
      restricted_keys = { "gj", "gk", "h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
      hint_keys = { "k", "j", "^", "$", "a", "x", "i", "d", "y", "c", "l" },
      disabled_keys = { "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason" }
    }
  },
}
