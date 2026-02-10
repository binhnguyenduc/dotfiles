---@type LazySpec
return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_foreground = "mix"
      vim.o.background = "dark"
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha",
      integrations = {
        mason = true,
        neotree = true,
        noice = true,
        notify = true,
        gitsigns = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
      },
    },
  },
  {
    "sainnhe/everforest",
    lazy = true,
    init = function() vim.g.everforest_better_performance = 1 end,
  },
  { "sainnhe/edge", lazy = true, init = function() vim.g.edge_better_performance = 1 end },
  { "sainnhe/sonokai", lazy = true, init = function() vim.g.sonokai_better_performance = 1 end },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
}
