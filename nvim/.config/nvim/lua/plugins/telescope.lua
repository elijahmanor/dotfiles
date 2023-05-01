local Util = require("lazyvim.util")

return {
  {
   "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>fR", Util.telescope("resume"), desc = "Resume" },
    }
  }
}
