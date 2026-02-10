-- Custom filetypes
vim.filetype.add({
  extension = {
    zsh = "zsh",
    jsonnet = "jsonnet",
    prisma = "prisma",
    mmd = "mermaid",
    mermaid = "mermaid",
  },
  pattern = {
    ["%.zsh.*"] = "zsh",
    ["Dockerfile.*"] = "dockerfile",
  },
})
