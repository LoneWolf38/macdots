local M = {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
  },
  setup = function()
    vim.g.db_ui_save_location = "~/.config/nvim/db_ui"
  end,
}

return M
