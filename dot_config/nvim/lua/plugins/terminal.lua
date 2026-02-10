---@type LazySpec
return {
  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = {
      { "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>", desc = "Terminal (float)" },
      { "<Leader>th", "<Cmd>ToggleTerm size=15 direction=horizontal<CR>", desc = "Terminal (horizontal)" },
      { "<Leader>tv", "<Cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "Terminal (vertical)" },
      { "<F7>", "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.3
        end
      end,
      float_opts = {
        border = "curved",
        width = function() return math.floor(vim.o.columns * 0.9) end,
        height = function() return math.floor(vim.o.lines * 0.9) end,
      },
      highlights = {
        NormalFloat = { link = "Normal" },
        FloatBorder = { link = "FloatBorder" },
      },
      autochdir = true,
    },
  },

  -- Tmux awesome manager
  {
    "otavioschwanck/tmux-awesome-manager.nvim",
    event = "VeryLazy",
    cond = function() return vim.env.TMUX ~= nil end,
    config = function()
      local tmux = require("tmux-awesome-manager")
      tmux.setup({
        per_project_commands = {
        },
        session_name = "Neovim Terminals",
        use_icon = true,
        icon = " ",
        project_open_as = "separated_session",
        default_size = "30%",
        open_new_as = "pane",
      })

      -- Tmux keymaps under <Leader>m
      vim.keymap.set("v", "<Leader>ms", tmux.send_text_to, { desc = "Send text to terminal" })
      vim.keymap.set("n", "<Leader>mo", tmux.switch_orientation, { desc = "Switch orientation" })
      vim.keymap.set("n", "<Leader>mp", tmux.switch_open_as, { desc = "Switch open as" })
      vim.keymap.set("n", "<Leader>mk", tmux.kill_all_terms, { desc = "Kill all terminals" })
      vim.keymap.set("n", "<Leader>m!", tmux.run_project_terms, { desc = "Run project terminals" })
      vim.keymap.set("n", "<Leader>ml", function() vim.cmd(":Telescope tmux-awesome-manager list_terms") end, { desc = "List all terminals" })
      vim.keymap.set("n", "<Leader>mL", function() vim.cmd(":Telescope tmux-awesome-manager list_open_terms") end, { desc = "List open terminals" })

      -- Make target helper
      vim.keymap.set("n", "<Leader>mM", function()
        if not vim.fn.filereadable("Makefile") then
          vim.notify("No Makefile found", vim.log.levels.WARN)
          return
        end
        local lines = vim.fn.readfile("Makefile")
        local targets = {}
        for _, line in ipairs(lines) do
          local target = line:match("^([%w_%-]+)%s*:")
          if target and not target:match("^%.") then
            table.insert(targets, target)
          end
        end
        vim.ui.select(targets, { prompt = "Make target:" }, function(choice)
          if choice then
            tmux.execute_command({
              cmd = "(make " .. choice .. " && echo; echo; echo Done) || (echo; echo; echo Failed)",
              name = "Make",
              use_cwd = true,
            })
          end
        end)
      end, { desc = "Run Make target" })
    end,
  },
}
