return {
  {
    "gregorias/nvim-mapper",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function() require"nvim-mapper".setup{} end,
    lazy = false,
    priority = 1001
  }
}
