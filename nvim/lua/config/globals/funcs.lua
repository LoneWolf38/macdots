-- vim.keymap.set("n", "<leader>'", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add to Harpoon" })

-- Global func for keymap set
local M = {}

-- this is only used for testing if the keymap func is loaded or not
function M.Println()
  print("keymap table is loaded")
end

function M.Set(mode, lhs, rhs, opts)
  if opts ~= nil then
    opts = {}
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
