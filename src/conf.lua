--[[
conf.lua
Author: Bayrock (http://Devinity.org)
]]

projectName = "Lua Physics Demo "
version = "v0.7"

debug = false

wallWidth = 25
windowWidth = 800
windowHeight = 600
windowHeightB = windowHeight - wallWidth

ballSize = 20

function love.conf(t)
    t.version = "0.9.1"
    t.console = true
    t.window.title = projectName.."- build: "..(version)
    t.window.icon = nil
    t.window.width = windowWidth
    t.window.height = windowHeight
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 1
    t.window.minheight = 1
    t.window.fullscreen = false
    t.window.fullscreentype = "normal"
    t.window.vsync = false
    t.window.fsaa = 0
    t.window.display = 1
    t.window.highdpi = false
    t.window.srgb = false

    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.timer = true
    t.modules.window = true
    t.modules.thread = true
end
