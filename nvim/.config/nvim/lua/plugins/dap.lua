return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    keys = {
      { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run File Tests" },
      {
        "<leader>tF",
        "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
        desc = "Debug File Tests",
      },
      { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run Last Test" },
      { "<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", desc = "Debug Last Test" },
      { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run Nearest Test" },
      { "<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest Test" },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Test Output" },
      { "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop Test" },
      { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Test Summary" },
    },
    -- :h neotest.output
    -- :h neotest.output_panel
    -- :h neotest.summary
    -- :h neotest.diagnostic
    -- :h neotest.status
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
  {
    "klen/nvim-test",
    config = function() 
      require('nvim-test').setup()
      require('nvim-test.runners.jest'):setup {
        command = "~/node_modules/.bin/jest",                                       -- a command to run the test runner
        args = { "--collectCoverage=false" },                                       -- default arguments
        env = { CUSTOM_VAR = 'value' },                                             -- custom environment variables

        file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",   -- determine whether a file is a testfile
        find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },                  -- find testfile for a file

        filename_modifier = nil,                                                    -- modify filename before tests run (:h filename-modifiers)
        working_directory = nil,                                                    -- set working directory (cwd by default)
      }
    end 
  }
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "js-debug-adapter",
  --     },
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   dependencies = {
  --     {
  --       "jbyuki/one-small-step-for-vimkind",
  --       -- stylua: ignore
  --       keys = {
  --         { "<leader>daL", function() require("osv").launch({ port = 8086 }) end, desc = "Adapter Lua Server" },
  --         { "<leader>dal", function() require("osv").run_this() end, desc = "Adapter Lua" },
  --       },
  --       config = function()
  --         local dap = require("dap")
  --         dap.adapters.nlua = function(callback, config)
  --           callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
  --         end
  --         dap.configurations.lua = {
  --           {
  --             type = "nlua",
  --             request = "attach",
  --             name = "Attach to running Neovim instance",
  --           },
  --         }
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   event = "VeryLazy",
  --   config = function()
  --     local dap = require("dap")
  --     local dap_js = require("dap-vscode-js")
  --     local mason_registry = require("mason-registry")
  --     local js_debug_pkg = mason_registry.get_package("js-debug-adapter")
  --     local js_debug_path = js_debug_pkg:get_install_path()
  --     print("js_debug_path: " .. js_debug_path)
  --     dap_js.setup({
  --       debugger_path = js_debug_path,
  --       adapters = { "pwa-node", "node-terminal" }, -- which adapters to register in nvim-dap
  --     })
  --     for _, language in ipairs({ "typescript", "javascript" }) do
  --       dap.configurations[language] = {
  --         {
  --           type = "pwa-node",
  --           request = "launch",
  --           name = "Launch file (" .. language .. ")",
  --           program = "${file}",
  --           cwd = "${workspaceFolder}",
  --         },
  --         {
  --           type = "pwa-node",
  --           request = "attach",
  --           name = "Attach (" .. language .. ")",
  --           processId = require("dap.utils").pick_process,
  --           cwd = "${workspaceFolder}",
  --         },
  --       }
  --     end
  --   end,
  -- },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   dependencies = {
  --     {
  --       "mxsdev/nvim-dap-vscode-js",
  --       dependencies = { "mfussenegger/nvim-dap" },
  --       opts = {
  --         -- node_path = os.getenv("HOME") .. "/.nvm/versions/node/v18.2.0/bin/node",
  --         debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  --         adapters = { "pwa-node", "pwa-chrome" }, -- which adapters to register in nvim-dap
  --       },
  --       config = function()
  --         local dap = require("dap")
  --         for _, language in ipairs({ "typescript", "javascript" }) do
  --           dap.configurations[language] = {
  --             {
  --               type = "pwa-node",
  --               request = "launch",
  --               name = "Launch file",
  --               program = "${file}",
  --               cwd = "${workspaceFolder}",
  --               sourceMaps = true,
  --               skipFiles = { "<node_internals>/**", "node_modules/**" },
  --             },
  --             {
  --               type = "pwa-node",
  --               request = "attach",
  --               name = "Attach",
  --               processId = require("dap.utils").pick_process,
  --               cwd = "${workspaceFolder}",
  --             },
  --           }
  --           require("dap").adapters["pwa-node"] = {
  --             type = "server",
  --             host = "localhost",
  --             port = "${port}",
  --             executable = {
  --               command = "node",
  --               args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter", "${port}" },
  --             },
  --           }
  --         end
  --       end,
  --     },
  --     {
  --       "microsoft/vscode-js-debug",
  --       lazy = true,
  --       build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  --     },
  --   },
  --   opts = {
  --     ensure_installed = { "chrome", "python", "node" },
  --     -- ensure_installed = { "python" },
  --     -- handlers = {
  --     --   python = function(source_name)
  --     --     local dap = require("dap")
  --     --     dap.adapters.python = {
  --     --       type = "executable",
  --     --       command = "/usr/bin/python3",
  --     --       args = {
  --     --         "-m",
  --     --         "debugpy.adapter",
  --     --       },
  --     --     }
  --     --
  --     --     dap.configurations.python = {
  --     --       {
  --     --         type = "python",
  --     --         request = "launch",
  --     --         name = "Launch file",
  --     --         program = "${file}", -- This configuration will launch the current file if used.
  --     --       },
  --     --     }
  --     --   end,
  --     -- },
  --     -- javascript = function()
  --     --   local dap = require("dap")
  --     --   dap.adapters["pwa-node"] = {
  --     --     type = "server",
  --     --     host = "localhost",
  --     --     port = "${port}",
  --     --     executable = {
  --     --       command = "node",
  --     --       -- 💀 Make sure to update this path to point to your installation
  --     --       args = { "/path/to/js-debug/src/dapDebugServer.js", "${port}" },
  --     --     },
  --     --   }
  --     --
  --     --   dap.configurations.javascript = {
  --     --     {
  --     --       type = "pwa-node",
  --     --       request = "launch",
  --     --       name = "Launch file",
  --     --       program = "${file}",
  --     --       cwd = "${workspaceFolder}",
  --     --     },
  --     --   }
  --     -- end,
  --   },
  -- },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   dependencies = {
  --     { "mxsdev/nvim-dap-vscode-js", dependencies = {"mfussenegger/nvim-dap"} },
  --     {
  --       "microsoft/vscode-js-debug",
  --       lazy = true,
  --       build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  --     },
  --   },
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, { "js" })
  --
  --     opts.handlers = {
  --         function(config)
  --           -- all sources with no handler get passed here
  --
  --           -- Keep original functionality
  --           require('mason-nvim-dap').default_setup(config)
  --         end,
  --         python = function(config)
  --             config.adapters = {
  --               type = "executable",
  --               command = "/usr/bin/python3",
  --               args = {
  --                 "-m",
  --                 "debugpy.adapter",
  --               },
  --             }
  --             require('mason-nvim-dap').default_setup(config) -- don't forget this!
  --         end,
  --         node2 = function(config)
  --             require('mason-nvim-dap').default_setup(config) -- don't forget this!
  --         end,
  --         chrome = function(config)
  --             require('mason-nvim-dap').default_setup(config) -- don't forget this!
  --       end
  --     }
  --   end,
  -- config = function()
  --   -- https://github.com/mxsdev/nvim-dap-vscode-js
  --   require("dap-vscode-js").setup({
  --     -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  --     -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  --     -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  --     adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  --     -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  --     log_file_level = true, -- Logging level for output to file. Set to false to disable file logging.
  --     log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
  --   })
  --
  --   for _, language in ipairs({ "typescript", "javascript" }) do
  --     require("dap").configurations[language] = {
  --       {
  --         type = "pwa-node",
  --         request = "launch",
  --         name = "Launch file",
  --         program = "${file}",
  --         cwd = "${workspaceFolder}",
  --       },
  --       {
  --         type = "pwa-node",
  --         request = "attach",
  --         name = "Attach",
  --         processId = require("dap.utils").pick_process,
  --         cwd = "${workspaceFolder}",
  --       },
  --       {
  --         type = "pwa-node",
  --         request = "launch",
  --         name = "Debug Jest Tests",
  --         -- trace = true, -- include debugger info
  --         runtimeExecutable = "node",
  --         runtimeArgs = {
  --           "./node_modules/jest/bin/jest.js",
  --           "--runInBand",
  --         },
  --         rootPath = "${workspaceFolder}",
  --         cwd = "${workspaceFolder}",
  --         console = "integratedTerminal",
  --         internalConsoleOptions = "neverOpen",
  --       },
  --     }
  --   end
  --
  -- https://github.com/alpha2phi/neovim-for-beginner/blob/64-dap-javascript/lua/config/dap/javascript.lua
  -- local DEBUGGER_PATH = vim.fn.stdpath("data") .. "/site/pack/packer/opt/vscode-js-debug"
  -- require("dap-vscode-js").setup({
  --   node_path = "node",
  --   debugger_path = DEBUGGER_PATH,
  --   -- debugger_cmd = { "js-debug-adapter" },
  --   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  -- })
  --
  -- for _, language in ipairs({ "typescript", "javascript" }) do
  --   require("dap").configurations[language] = {
  --     {
  --       type = "pwa-node",
  --       request = "launch",
  --       name = "Launch file",
  --       program = "${file}",
  --       cwd = "${workspaceFolder}",
  --     },
  --     {
  --       type = "pwa-node",
  --       request = "attach",
  --       name = "Attach",
  --       processId = require("dap.utils").pick_process,
  --       cwd = "${workspaceFolder}",
  --     },
  --     {
  --       type = "pwa-node",
  --       request = "launch",
  --       name = "Debug Jest Tests",
  --       -- trace = true, -- include debugger info
  --       runtimeExecutable = "node",
  --       runtimeArgs = {
  --         "./node_modules/jest/bin/jest.js",
  --         "--runInBand",
  --       },
  --       rootPath = "${workspaceFolder}",
  --       cwd = "${workspaceFolder}",
  --       console = "integratedTerminal",
  --       internalConsoleOptions = "neverOpen",
  --     },
  --   }
  -- end
  --
  -- for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
  --   require("dap").configurations[language] = {
  --     {
  --       type = "pwa-chrome",
  --       name = "Attach - Remote Debugging",
  --       request = "attach",
  --       program = "${file}",
  --       cwd = vim.fn.getcwd(),
  --       sourceMaps = true,
  --       protocol = "inspector",
  --       port = 9222,
  --       webRoot = "${workspaceFolder}",
  --     },
  --     {
  --       type = "pwa-chrome",
  --       name = "Launch Chrome",
  --       request = "launch",
  --       url = "http://localhost:3000",
  --     },
  --   }
  -- end
  -- end,
  -- },
}
