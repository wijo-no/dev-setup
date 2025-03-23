return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "godlygeek/tabular",
    cmd = { "Tabularize" },
  },
  {
    "tpope/vim-dispatch",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-runner",
    lazy = false,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    ft = { "markdown" },
    opts = {
      highlight_code = true,
      theme = "default",
    },
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      git = { enabled = true },
      lazygit = { enabled = true },
      gitbrowse = { enabled = true },
      indent = {
        enabled = true,
        char = "│",
        only_scope = false,
        only_current = false,
        hl = "SnacksIndent",
        animate = { enabled = false },
        scope = {
          enabled = true,
          char = "│",
          underline = false,
          only_current = false,
          hl = "SnacksIndentScope",
        },
      },
      notifier = { enabled = true },
    },
    keys = {
      {
        "<leader>gg",
        function()
          require("snacks").lazygit.open()
        end,
        desc = "Open LazyGit",
      },
      {
        "<leader>gl",
        function()
          require("snacks").lazygit.log()
        end,
        desc = "Lazygit Log (cwd)",
      },
      {
        "<leader>gf",
        function()
          require("snacks").lazygit.log_file()
        end,
        desc = "Lazygit File History",
      },
      {
        "<leader>go",
        function()
          require("snacks").gitbrowse.open()
        end,
        desc = "Open file in browser",
      },
      {
        "<leader>gr",
        function()
          require("snacks").gitbrowse.open { what = "repo" }
        end,
        desc = "Open repo in browser",
      },
      {
        "<leader>gb",
        function()
          require("snacks").git.blame_line()
        end,
        desc = "Git blame for current line",
      },
    },
  },
  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_linters = {
        html = { "htmlhint" },
        cshtml = { "htmlhint" },
      }
      vim.g.ale_fixers = {
        ruby = { "rubocop" },
      }
      vim.g.ale_fix_on_save = 1
    end,
    ft = { "html", "cshtml", "ruby", "lua" },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "vue" },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup {
        ensure_installed = { "prettier", "stylua" },
        automatic_installation = true, -- Automatisk installer formattere via mason
      }

      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          -- Prettier for formatering av JavaScript, TypeScript, HTML, CSS
          null_ls.builtins.formatting.prettier.with {
            filetypes = { "javascript", "typescript", "typescriptreact", "html", "css", "json" },
          },
          -- Stylua for Lua
          null_ls.builtins.formatting.stylua,
        },
        on_attach = function(client, bufnr)
          -- Automatisk formatering ved lagring
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end,
      }
    end,
  },
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },

  {
    "nvim-neotest/nvim-nio",
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio", -- Legg til denne linjen
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
