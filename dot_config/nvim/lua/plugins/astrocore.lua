---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 2,
        expandtab = true,
        ignorecase = true,
        smartcase = true,
        clipboard = "unnamedplus",
        mouse = "a",
        mousemoveevent = true,
        termguicolors = true,
        updatetime = 300,
        backup = false,
        writebackup = false,
        undofile = true,
        undolevels = 1000,
        undoreload = 10000,
        diffopt = "internal,filler,closeoff,vertical",
        sessionoptions = "buffers,curdir,folds,help,tabpages,winsize",
        foldmethod = "expr",
        foldexpr = "nvim_treesitter#foldexpr()",
        foldlevelstart = 99,
        guifont = "Hack Nerd Font Mono:h15",
      },
      g = {},
    },
    -- Which-key group registrations
    mappings = {
      n = {
        -- === Which-key group prefixes ===
        ["<Leader>f"] = { desc = " Find" },
        ["<Leader>g"] = { desc = "󰊢 Git" },
        ["<Leader>gd"] = { desc = " Diffview" },
        ["<Leader>gO"] = { desc = " GitHub" },
        ["<Leader>G"] = { desc = "󰟓 Go" },
        ["<Leader>l"] = { desc = " LSP" },
        ["<Leader>a"] = { desc = "󰚩 AI" },
        ["<Leader>m"] = { desc = " Tmux" },
        ["<Leader>t"] = { desc = " Terminal" },
        ["<Leader>T"] = { desc = " Trouble" },

        -- === Window navigation (Ctrl+hjkl) ===
        ["<C-h>"] = { "<Cmd>wincmd h<CR>", desc = "Move to left window" },
        ["<C-j>"] = { "<Cmd>wincmd j<CR>", desc = "Move to below window" },
        ["<C-k>"] = { "<Cmd>wincmd k<CR>", desc = "Move to above window" },
        ["<C-l>"] = { "<Cmd>wincmd l<CR>", desc = "Move to right window" },

        -- === Buffer navigation ===
        ["<S-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- === Telescope Find mappings (<Leader>f) ===
        ["<Leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
        ["<Leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words (grep)" },
        ["<Leader>fb"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
        ["<Leader>fg"] = { function() require("telescope.builtin").git_files() end, desc = "Find git files" },
        ["<Leader>fs"] = { function() require("telescope.builtin").lsp_document_symbols() end, desc = "Find symbols" },
        ["<Leader>fS"] = { function() require("telescope.builtin").lsp_workspace_symbols() end, desc = "Find workspace symbols" },
        ["<Leader>fm"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" },
        ["<Leader>fd"] = { function() require("telescope.builtin").diagnostics() end, desc = "Find diagnostics" },
        ["<Leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find old files" },
        ["<Leader>fk"] = { function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" },
        ["<Leader>fc"] = { function() require("telescope.builtin").commands() end, desc = "Find commands" },
        ["<Leader>fh"] = { function() require("telescope.builtin").command_history() end, desc = "Find command history" },
        ["<Leader>f/"] = { function() require("telescope.builtin").search_history() end, desc = "Find search history" },
        ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undo history" },
        ["<Leader>fM"] = { function() require("telescope.builtin").man_pages() end, desc = "Find man pages" },
        ["<Leader>fO"] = { function() require("telescope.builtin").vim_options() end, desc = "Find vim options" },
        ["<Leader>fn"] = { function() require("telescope").extensions.notify.notify() end, desc = "Find notifications" },
        ["<Leader>fC"] = { function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, desc = "Find colorschemes" },
        ["<Leader>fe"] = { function() require("telescope").extensions.symbols.symbols({ sources = { "emoji", "nerd" } }) end, desc = "Find symbols/emoji" },
        ["<Leader>ft"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help tags" },
        ["<Leader>fB"] = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find in buffer (lines)" },
        ["<Leader>fG"] = { function() require("telescope.builtin").git_status() end, desc = "Find git status" },

        -- === LSP mappings (<Leader>l) ===
        ["<Leader>lr"] = { function() vim.lsp.buf.rename() end, desc = "Rename symbol" },
        ["<Leader>la"] = { function() vim.lsp.buf.code_action() end, desc = "Code action" },
        ["<Leader>lf"] = { function() vim.lsp.buf.format({ async = true }) end, desc = "Format buffer" },
        ["<Leader>ll"] = { function() vim.lsp.codelens.run() end, desc = "CodeLens action" },
        ["<Leader>lL"] = { function() vim.lsp.codelens.refresh() end, desc = "CodeLens refresh" },
        ["<Leader>lo"] = { function() vim.lsp.buf.execute_command({ command = "editor.action.organizeImports" }) end, desc = "Organize imports" },
        ["<Leader>ld"] = { function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, desc = "Buffer diagnostics" },
        ["<Leader>lD"] = { function() require("telescope.builtin").diagnostics() end, desc = "Workspace diagnostics" },

        -- === Diagnostic navigation ===
        ["g["] = { function() vim.diagnostic.goto_prev() end, desc = "Previous diagnostic" },
        ["g]"] = { function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" },

        -- === Explorer ===
        ["<Leader>e"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
        ["<Leader>o"] = { function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd "p"
          else
            vim.cmd.Neotree "focus"
          end
        end, desc = "Toggle Explorer Focus" },

        -- === Colorscheme switch ===
        ["<Leader>uc"] = { function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, desc = "Change colorscheme" },
      },
      v = {
        -- Visual mode clipboard
        ["<C-c>"] = { '"+y', desc = "Copy to clipboard" },
      },
      t = {
        -- Terminal mode escape
        ["<Esc><Esc>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
      },
    },
    autocmds = {
      polish = {
        {
          event = "FileType",
          pattern = "markdown",
          callback = function() vim.opt_local.conceallevel = 0 end,
          desc = "Disable conceallevel for markdown",
        },
      },
    },
  },
}
