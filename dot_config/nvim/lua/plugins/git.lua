---@type LazySpec
return {
  -- Gitsigns (inline blame + hunk operations)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
      },
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▁" },
        topdelete = { text = "▔" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Hunk navigation
        map("n", "]h", function() gs.nav_hunk("next") end, { desc = "Next hunk" })
        map("n", "[h", function() gs.nav_hunk("prev") end, { desc = "Previous hunk" })
        -- Hunk actions
        map("n", "<Leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
        map("n", "<Leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<Leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
        map("v", "<Leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage hunk" })
        map("v", "<Leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset hunk" })
        map("n", "<Leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
        map("n", "<Leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
        map("n", "<Leader>gv", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<Leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Blame line (full)" })
        map("n", "<Leader>gB", gs.toggle_current_line_blame, { desc = "Toggle inline blame" })
      end,
    },
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<Leader>gdo", "<Cmd>DiffviewOpen<CR>", desc = "Open diffview" },
      { "<Leader>gdc", "<Cmd>DiffviewClose<CR>", desc = "Close diffview" },
      { "<Leader>gdh", "<Cmd>DiffviewFileHistory %<CR>", desc = "File history (current)" },
      { "<Leader>gdH", "<Cmd>DiffviewFileHistory<CR>", desc = "File history (all)" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_mixed" },
      },
    },
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<Leader>gg", "<Cmd>Neogit<CR>", desc = "Neogit status" },
      { "<Leader>gc", "<Cmd>Neogit commit<CR>", desc = "Neogit commit" },
      { "<Leader>gP", "<Cmd>Neogit push<CR>", desc = "Neogit push" },
      { "<Leader>gl", "<Cmd>Neogit pull<CR>", desc = "Neogit pull" },
      { "<Leader>gL", "<Cmd>Neogit log<CR>", desc = "Neogit log" },
    },
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
      signs = {
        section = { "", "" },
        item = { "", "" },
      },
    },
  },

  -- Octo (GitHub PRs, Issues)
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    keys = {
      { "<Leader>gOp", "<Cmd>Octo pr list<CR>", desc = "PR list" },
      { "<Leader>gOs", "<Cmd>Octo pr search<CR>", desc = "PR search" },
      { "<Leader>gOi", "<Cmd>Octo issue list<CR>", desc = "Issue list" },
      { "<Leader>gOI", "<Cmd>Octo issue search<CR>", desc = "Issue search" },
      { "<Leader>gOg", "<Cmd>Octo gist list<CR>", desc = "Gist list" },
      { "<Leader>gOa", "<Cmd>Octo actions<CR>", desc = "Octo actions" },
    },
    opts = {},
  },
}
