require("tokyonight").setup({
  style = "night",
  light_style = "moon",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "transparent",
    floats = "normal",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = true,
  dim_inactive = true,
  lualine_bold = true,

  ---@param colors ColorScheme
  on_colors = function(colors) end,

  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

vim.cmd [[colorscheme tokyonight]]
