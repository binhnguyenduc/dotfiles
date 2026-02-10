---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  build = function() vim.cmd.GoInstallDeps() end,
  opts = {},
  keys = {
    -- Struct tags
    { "<Leader>Gta", "<Cmd>GoTagAdd json<CR>", desc = "Add tags (json)", ft = "go" },
    { "<Leader>Gtr", "<Cmd>GoTagRm json<CR>", desc = "Remove tags (json)", ft = "go" },
    { "<Leader>Gtc", function()
      vim.ui.input({ prompt = "Tag type: " }, function(tag)
        if tag and tag ~= "" then vim.cmd("GoTagAdd " .. tag) end
      end)
    end, desc = "Add tags (prompt)", ft = "go" },

    -- Tests
    { "<Leader>Gte", "<Cmd>GoTestsAll<CR>", desc = "Generate tests (exported)", ft = "go" },
    { "<Leader>Gtf", "<Cmd>GoTestsAll<CR>", desc = "Generate tests (file)", ft = "go" },
    { "<Leader>Gtu", "<Cmd>GoTestAdd<CR>", desc = "Generate test (function)", ft = "go" },

    -- Mod
    { "<Leader>Gm", "<Cmd>GoMod tidy<CR>", desc = "Go mod tidy", ft = "go" },

    -- Interface implementation
    { "<Leader>Gi", function()
      vim.ui.input({ prompt = "Interface (e.g. io.Reader): " }, function(iface)
        if iface and iface ~= "" then vim.cmd("GoImpl " .. iface) end
      end)
    end, desc = "Implement interface", ft = "go" },

    -- Toggle test file
    { "<Leader>GT", "<Cmd>GoTestToggle<CR>", desc = "Toggle test file", ft = "go" },

    -- Run test
    { "<Leader>Gr", function()
      local term = require("toggleterm.terminal").Terminal
      local go_test = term:new({
        cmd = "go test -v ./...",
        direction = "horizontal",
        close_on_exit = false,
      })
      go_test:toggle()
    end, desc = "Run tests (./...)", ft = "go" },
  },
}
