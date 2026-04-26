return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap", -- Required for debugging features
      "folke/snacks.nvim", -- Recommended for pickers, test runner, etc.
    },
    config = function()
      local dotnet = require("easy-dotnet")
      dotnet.setup({
        -- Choose your picker: "snacks" (default if available), "telescope", "fzf", or "basic"
        picker = "snacks",
        lsp = {
          enabled = true, -- Built-in Roslyn LSP is enabled by default
        },
        test_runner = {
          viewmode = "float", -- Can be "split", "vsplit", or "float"
          auto_start_testrunner = true,
        },
        -- ... other options as described in the GitHub README
      })

      -- Optional: Create your own commands or keymaps
      vim.keymap.set("n", "<leader>rr", dotnet.run, { desc = "Run .NET project" })
      vim.keymap.set("n", "<leader>rb", dotnet.build, { desc = "Build .NET project" })
    end,
  },
}
