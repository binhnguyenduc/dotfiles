---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Language packs
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.rust" },

  -- Motion
  { import = "astrocommunity.motion.flash-nvim" },

  -- Colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Editing support
  { import = "astrocommunity.editing-support.copilotchat-nvim" },
}
