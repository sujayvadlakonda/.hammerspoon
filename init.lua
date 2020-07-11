-- Hotkey to reload Hammerspoon
hs.hotkey.bind({"ctrl", "cmd", "alt"}, "R", function() hs.reload() end)

-- Disable window animation
hs.window.animationDuration = 0

-- Ctrl + F to Maximize Frame
hs.hotkey.bind({"ctrl"}, "F", function() hs.window.focusedWindow():setFullScreen(true) end)

-- Make Launched Windows Full Screen
function autoFullScreen()
  return function(window, appName)
    -- Unless the App is Finder
    if appName ~= "Finder" then
      hs.window.focusedWindow():setFullScreen(true)
    end
  end
end

hs.window.filter.default:subscribe(hs.window.filter.windowFocused, autoFullScreen)

-- Useful Keybindings to quickly open apps
-- Combines with autoFullScreen to quickly launch and full screen
function open(name)
  return function()
    hs.window.desktop():focus()
    hs.application.open(name):activate()
  end
end

hs.hotkey.bind({"alt"}, "C", open("Google Chrome"))
hs.hotkey.bind({"alt"}, "T", open("Terminal"))
hs.hotkey.bind({"alt"}, "E", open("Emacs"))
hs.hotkey.bind({"alt"}, "A", open("Avidemux_2.7.4.app"))
hs.hotkey.bind({"alt"}, "S", open("System Preferences"))
hs.hotkey.bind({"alt"}, "F", open("Finder"))
hs.hotkey.bind({"alt"}, "Q", open("qBittorrent"))
hs.hotkey.bind({"alt"}, "B", open("Battle.net.app"))

-- Loads HoldToQuit Spoon
-- Press and Hold Cmd + Q to quit an application
local holdToQuitSpoon = hs.loadSpoon("HoldToQuit")
holdToQuitSpoon:init()
holdToQuitSpoon:start()
