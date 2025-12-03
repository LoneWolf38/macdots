local status, hyperModeAppMappings = pcall(require, 'hyper-apps')

hs.application.enableSpotlightForNameSearches(true)

if not status then
  hyperModeAppMappings = require('hyper-apps-defaults')
end



for i, mapping in ipairs(hyperModeAppMappings) do
  local key = mapping[1]
  local app = mapping[2]
  hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, key, function()
    if (type(app) == 'string') then
      launchOrFocusOrRotate(app)
    elseif (type(app) == 'function') then
      app()
    else
      hs.logger.new('hyper'):e('Invalid mapping for Hyper +', key)
    end
  end)
end

-- launch, focus or rotate application
function launchOrFocusOrRotate(app)
  local focusedWindow = hs.window.focusedWindow()
  -- If already focused, try to find the next window
  if focusedWindow:application():name() == app then
      local appWindows = hs.application.get(app):allWindows()
      if #appWindows > 0 then
          -- It seems that this list order changes after one window get focused, 
          -- let's directly bring the last one to focus every time
          appWindows[#appWindows]:focus()
      else -- this should not happen, but just in case
          hs.application.launchOrFocus(app)
      end
  else -- if not focused
      hs.application.launchOrFocus(app)
  end
end