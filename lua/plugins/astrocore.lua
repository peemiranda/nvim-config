-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<leader>s"] = { ":tabe ~/.config/nvim<cr>", desc = "Open Astronvim Config Folder" },

        ["<C-p>"] = {
          function()
            require("telescope.builtin").find_files {
              hidden = true,
              no_ignore = true,
              ignore_file_patterns = { "node%_modules/*" },
            }
          end,
          desc = "Find all files",
        },

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<cr>"] = { "zz", desc = "Centralize screen" },

        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },

        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { desc = "Buffers" },

        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        -- Move line
        ["<A-j>"] = { ":m .+1<cr>==", desc = "Move line down" },
        ["<A-k>"] = { ":m .-2<cr>==", desc = "Move line up" },
        ["<A-F>"] = {
          function() vim.lsp.buf.format() end,
          desc = "Format buffer",
        },

        ["<leader>P"] = { ":syntax sync fromstart<cr>", desc = "Sync syntax from start" },

        ["<leader>a"] = {
          function() vim.lsp.buf.code_action() end,
          desc = "Run LSP code actions",
        },

        ["U"] = {
          function() require("dapui").eval() end,
          desc = "Eval expression",
        },
      },

      t = {
        ["<esc>"] = { "<C-\\><C-n>", desc = "Exit from terminal mode" },
      },

      i = {
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        -- move line
        ["<A-j>"] = { "<esc>:m .+1<cr>==gi", desc = "Move line down" },
        ["<A-k>"] = { "<esc>:m .-2<cr>==gi", desc = "Move line up" },

        ["<C-Space>"] = {
          function() vim.lsp.buf.hover() end,
          desc = "Show lsp options",
        },
      },

      v = {
        -- move line
        ["<A-j>"] = { ":m .+1<cr>==gi", desc = "Move line down" },
        ["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move line up" },
      },
    },
  },
}
