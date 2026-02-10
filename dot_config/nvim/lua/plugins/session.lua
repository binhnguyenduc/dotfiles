---@type LazySpec
return {
  -- Disable AstroNvim's built-in resession in favor of neovim-session-manager
  { "stevearc/resession.nvim", enabled = false },
  {
    "Shatur/neovim-session-manager",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "SessionManager",
    event = "VimLeavePre",
    keys = {
      { "<Leader>Ss", "<Cmd>SessionManager save_current_session<CR>", desc = "Save session" },
      { "<Leader>Sl", "<Cmd>SessionManager load_session<CR>", desc = "Load session" },
      { "<Leader>Sd", "<Cmd>SessionManager delete_session<CR>", desc = "Delete session" },
      { "<Leader>SL", "<Cmd>SessionManager load_last_session<CR>", desc = "Load last session" },
    },
    config = function()
      local config = require("session_manager.config")
      require("session_manager").setup({
        autoload_mode = config.AutoloadMode.Disabled,
        autosave_last_session = true,
        autosave_ignore_filetypes = {
          "gitcommit",
          "gitrebase",
          "alpha",
          "neo-tree",
        },
        autosave_only_in_session = false,
      })
    end,
  },
}
