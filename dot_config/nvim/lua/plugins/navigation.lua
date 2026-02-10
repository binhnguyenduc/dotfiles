---@type LazySpec
return {
  -- Telescope undo
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function() require("telescope").load_extension("undo") end,
  },
  -- Telescope fzf native (better sorting)
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function() require("telescope").load_extension("fzf") end,
  },
  -- Telescope symbols (emoji, nerd fonts)
  {
    "nvim-telescope/telescope-symbols.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  -- Telescope config overrides
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { preview_width = 0.5 },
          width = 0.9,
          height = 0.9,
        },
        file_ignore_patterns = { "node_modules", ".git/" },
        path_display = { "truncate" },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = {
          additional_args = function() return { "--hidden" } end,
        },
      },
    },
  },
}
