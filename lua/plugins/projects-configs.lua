return {
  {
    "windwp/nvim-projectconfig",
    lazy = false,
    config = function()
      require("nvim-projectconfig").setup {
        project_dir = "~/.config/nvim/lua/projects-configs/",
        silent = false,
      }
    end,
  },
}
