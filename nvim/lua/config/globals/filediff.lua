local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local make_entry = require("telescope.make_entry")
local sorters = require("telescope.sorters")

local M = {}

local f = function(branch, file_path)
  local diffview = require("diffview")
  diffview.open({ branch, "--", file_path })
end
M.file_diff = function(opts)
  opts = opts or {}
  local command = {
    "git",
    "for-each-ref",
    "--perl",
    "--format",
    "%(refname:short)",
    "--sort",
    "-authordate",
    opts.pattern,
  }

  local seen = {}
  local string_entry_maker = make_entry.gen_from_string()
  opts.entry_maker = function(string)
    if not seen[string] then
      seen[string] = true
      return string_entry_maker(string)
    else
      return nil
    end
  end

  pickers
    .new(opts, {
      prompt_title = "Select Branch to Compare",
      finder = finders.new_oneshot_job(command, opts),
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selected = actions_state.get_selected_entry()
          f(selected, vim.fn.expand("%"))
        end)
        return true
      end,
    })
    :find()
end

return M
