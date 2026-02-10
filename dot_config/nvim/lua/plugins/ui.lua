---@type LazySpec
return {
  -- Noice (cmdline UI, messages, notifications routing)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = { enabled = true },
        signature = { enabled = true },
        progress = { enabled = true },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      routes = {
        -- Skip "written" messages
        { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
      },
    },
  },

  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = "info",
      minimum_width = 25,
      render = "minimal",
      stages = "fade_in_slide_out",
      timeout = 1000,
      top_down = true,
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    opts = {
      handle = {
        text = " ",
        blend = 0,
        highlight = "Visual",
        hide_if_all_visible = true,
      },
      excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
        "neo-tree",
        "alpha",
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false,
        handle = true,
        search = true,
      },
    },
  },

  -- hlslens (search lens)
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    opts = { calm_down = true },
    keys = {
      { "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Next search result" },
      { "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Prev search result" },
      { "*", [[*<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word forward" },
      { "#", [[#<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word backward" },
      { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word forward (partial)" },
      { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], desc = "Search word backward (partial)" },
    },
  },

  -- nvim-ufo (better folds)
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    opts = {
      provider_selector = function() return { "treesitter", "indent" } end,
      open_fold_hl_timeout = 150,
    },
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
      { "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
    },
  },

  -- Dressing (better vim.ui.input/select)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { enabled = true },
      select = { enabled = true },
    },
  },
}
