---@type LazySpec
return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- Include the default AstroNvim config
    require("astronvim.plugins.configs.luasnip")(plugin, opts)

    local luasnip = require("luasnip")
    -- Extend filetypes (like UltiSnips extends)
    luasnip.filetype_extend("javascript", { "html" })
    luasnip.filetype_extend("typescript", { "javascript", "html" })
    luasnip.filetype_extend("typescriptreact", { "javascript", "html", "typescript" })
    luasnip.filetype_extend("javascriptreact", { "javascript", "html" })
    luasnip.filetype_extend("go", {})

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
