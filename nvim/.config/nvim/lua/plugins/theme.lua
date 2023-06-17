-- https://github.com/jascha030/macos-nvim-dark-mode
local os_is_dark = function()
    return (vim.call(
        'system',
        [[echo $(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo 'dark' || echo 'light')]]
    )):find('dark') ~= nil
end

return {
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
    opts = function(_, opts)
      if os_is_dark() then
        -- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
        opts.colorscheme = 'catppuccin-frappe'
      else
        opts.colorscheme = 'catppuccin-latte'
      end
    end,
  },
}
