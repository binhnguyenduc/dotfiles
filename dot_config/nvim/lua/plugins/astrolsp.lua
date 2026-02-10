---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 3200,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
              nilness = true,
              unusedwrite = true,
              useany = true,
            },
            staticcheck = true,
            gofumpt = true,
            codelenses = {
              gc_details = true,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            semanticTokens = true,
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            completion = { callSnippet = "Replace" },
          },
        },
      },
    },
    autocmds = {
      lsp_organize_imports = {
        cond = "textDocument/codeAction",
        {
          event = "BufWritePre",
          callback = function(args)
            local ft = vim.bo[args.buf].filetype
            if ft == "go" or ft == "typescript" or ft == "javascript" then
              local params = vim.lsp.util.make_range_params()
              params.context = { only = { "source.organizeImports" } }
              local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 3000)
              for _, res in pairs(result or {}) do
                for _, action in pairs(res.result or {}) do
                  if action.edit then
                    vim.lsp.util.apply_workspace_edit(action.edit, "utf-16")
                  elseif action.command then
                    vim.lsp.buf.execute_command(action.command)
                  end
                end
              end
            end
          end,
          desc = "Organize imports on save (Go, TS, JS)",
        },
      },
    },
    mappings = {
      n = {
        gd = { function() vim.lsp.buf.definition() end, desc = "Go to definition" },
        gr = { function() vim.lsp.buf.references() end, desc = "Go to references" },
        gy = { function() vim.lsp.buf.type_definition() end, desc = "Go to type definition" },
        gi = { function() vim.lsp.buf.implementation() end, desc = "Go to implementation" },
        K = { function() vim.lsp.buf.hover() end, desc = "Hover documentation" },
        ["<C-s>"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature help" },
      },
    },
  },
}
