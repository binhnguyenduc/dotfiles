---@type LazySpec
return {
  -- Early retirement (auto-close inactive buffers)
  {
    "chrisgrieser/nvim-early-retirement",
    event = "VeryLazy",
    opts = {
      retirementAgeMins = 120,
      notificationOnAutoClose = true,
    },
  },
  -- Disable better-escape (if AstroCommunity includes it, override here)
  {
    "max397574/better-escape.nvim",
    enabled = false,
  },
}
