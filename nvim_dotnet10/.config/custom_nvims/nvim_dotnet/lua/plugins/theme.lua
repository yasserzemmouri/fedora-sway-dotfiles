return {
  -- add catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  -- Optional: Enable transparency/acrylic background
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true, -- Enables transparent background
      -- Or for more control:
      -- term_colors = true,
      -- styles = {
      --   -- your style overrides
      -- },
    },
  },

  -- If you want true acrylic/blur effect (requires compositor support)
  -- For WezTerm, Kitty, or Alacritty with blur support
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      enable = true, -- Enable transparency
      extra_groups = { -- Extra highlight groups to make transparent
        "NormalFloat",
        "NormalNC",
      },
    },
  },
}
