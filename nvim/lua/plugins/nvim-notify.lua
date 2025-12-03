return {
  "rcarriga/nvim-notify",
  enabled = true,
  opts = function(_, opts)
    opts.background_colour = "#1a1b26"
    opts.timeout = 3000
    opts.top_down = true
  end,
}
