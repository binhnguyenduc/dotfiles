---@type LazySpec
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<Leader>Td", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Workspace diagnostics" },
    { "<Leader>Tb", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
    { "<Leader>Ts", "<Cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols" },
    { "<Leader>Tl", "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP references" },
    { "<Leader>TL", "<Cmd>Trouble loclist toggle<CR>", desc = "Location list" },
    { "<Leader>Tq", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
  },
  opts = {
    use_diagnostic_signs = true,
  },
}
