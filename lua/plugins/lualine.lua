return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    sections = {
      lualine_x = { "searchcount", "enconding", "fileformat", "filetype" },
    },
  },
}
