return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    -- https://github.com/catppuccin/nvim
    'catppuccin/nvim',
    name = "catppuccin",
    opts = {
      transparent_background = true,
      integrations = {
        notify = true,
        mini = true,
      },
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-latte",
      colorscheme = "catppuccin-frappe",
    },
  },
}
