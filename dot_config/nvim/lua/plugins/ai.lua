---@type LazySpec
return {
  -- Avante.nvim (AI assistant - Claude primary, OpenAI secondary)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      provider = "claude",
      auto_suggestions_provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        temperature = 0,
        max_tokens = 4096,
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        temperature = 0,
        max_tokens = 4096,
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        ask = "<Leader>aa",
        edit = "<Leader>ae",
        refresh = "<Leader>ar",
      },
      windows = {
        position = "right",
        wrap = true,
        width = 40,
      },
    },
    keys = {
      { "<Leader>aa", function() require("avante.api").ask() end, desc = "Avante ask", mode = { "n", "v" } },
      { "<Leader>ae", function() require("avante.api").edit() end, desc = "Avante edit", mode = "v" },
      { "<Leader>ar", function() require("avante.api").refresh() end, desc = "Avante refresh" },
      { "<Leader>at", "<Cmd>AvanteToggle<CR>", desc = "Avante toggle" },
    },
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          accept_word = "<M-k>",
          accept_line = "<M-j>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = true },
      filetypes = {
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
      },
    },
  },
}
