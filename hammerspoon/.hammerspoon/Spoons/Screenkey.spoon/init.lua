--- Spoons/Screenkey.spoon/init.lua

--- === Screenkey ===

-- stylua: ignore start
local events = hs.eventtap.event.types
local canvas = hs.canvas
local screen = hs.screen
local eventtap = hs.eventtap
local mouse = hs.mouse
local keycodes = hs.keycodes
local timer = hs.timer
-- stylua: ignore end

local obj = {}

obj.name = "Screenkey"
obj.version = "1.0"
obj.author = "Elijah Manor <elijahmanor@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

local logger = hs.logger.new("Screenkey")
obj.logger = logger

obj._attribs = {
	format = "%H:%M",
	textFont = "JetBrains Mono",
	textColor = { hex = "#e7e5da" },
	-- lualine bar
	textSize = 36,
	width = 250,
	height = 50,
	-- big video
	-- textSize = 60,
	-- width = 450,
	-- height = 90,
	hotkey = "escape",
	hotkeyMods = { "cmd", "alt", "ctrl" },
}
for k, v in pairs(obj._attribs) do
	obj[k] = v
end

-- this is a hello
function obj:init()
	if not self.canvas then
		self.canvas = canvas.new({ x = 0, y = 0, w = 0, h = 0 })
	end
	self.canvas[1] = { type = "rectangle", id = "part1", fillColor = { hex = "#000" } }
	self.canvas[2] = {
		type = "text",
		text = "",
		textFont = self.textFont,
		textSize = self.textSize,
		textColor = self.textColor,
		textLineBreak = "truncateHead",
		textAlignment = "right",
		frame = { x = "0%", y = "0%", h = "90%", w = "95%" },
	}
	local mainScreen = screen.primaryScreen()
	local mainRes = mainScreen:fullFrame()
	self.canvas:frame({
		x = (mainRes.w - self.width) / 2,
		y = (mainRes.h - self.height) / 2,
		w = self.width,
		h = self.height,
	})

	self.canvas:canvasMouseEvents(true, true)
	self.canvas:mouseCallback(function(_, event, _, x, y)
		if event == "mouseDown" then
			self.mouseMoveTracker = eventtap
				.new({ events.leftMouseDragged, events.leftMouseUp }, function(e)
					if e:getType() == events.leftMouseUp then
						self.mouseMoveTracker:stop()
						self.mouseMoveTracker = nil
					else
						local mousePosition = mouse.getAbsolutePosition()
						self.canvas:frame({
							x = mousePosition.x - x,
							y = mousePosition.y - y,
							w = self.width,
							h = self.height,
						})
					end
				end, false)
				:start()
		end
	end)

	self.keys = {}
	self.keyCount = {}
	self.uniqueIndex = 1
	self.capture = eventtap.new({
		eventtap.event.types.keyDown,
	}, function(event)
		local flags = event:getFlags()
		local character = keycodes.map[event:getKeyCode()]
		local combo = (flags.ctrl and "⌃" or "")
			.. (flags.alt and "⌥" or "")
			-- .. (flags.shift and "⇧" or "")
			.. (flags.cmd and "⌘" or "")
			.. string.gsub(({
				["return"] = "⏎",
				["delete"] = "⌫",
				["escape"] = "⎋",
				["space"] = "␣",
				["tab"] = "⇥",
				["up"] = "↑",
				["down"] = "↓",
				["left"] = "←",
				["right"] = "→",
				["F19"] = "",
			})[character] or character, "^%l", function(x)
				if flags.shift then
					return string.upper(x)
				end
				return x
			end)

		if self.resetTimer ~= nil then
			self.resetTimer:stop()
		end
		self.resetTimer = timer.doAfter(5, function()
			self.keys = {}
			self.keyCount = {}
			self:update_display()
		end)

		if self:getLastKey() == combo then
			self.keyCount[combo .. #self.keys] = self.keyCount[combo .. #self.keys] + 1
		else
			table.insert(self.keys, combo)
			self.keyCount[combo .. #self.keys] = 1
		end

		self:update_display()
	end)

	self._init_done = true

	return self
end

function obj:update_display()
	local display = ""
	for index, key in pairs(self.keys) do
		if self.keyCount[key .. index] > 1 then
			display = display .. key .. "×" .. self.keyCount[key .. index]
		else
			display = display .. key
		end
	end
	self.canvas[2].text = display
end

function obj:isShowing()
	return self.canvas:isShowing()
end

function obj:show()
	if not self.capture then
		self:init()
	end
	self.capture:start()

	self.canvas:show()
	if self.hotkey then
		self.cancel_hotkey = hs.hotkey.bind(self.hotkeyMods, self.hotkey, function()
			self:hide()
		end)
	end
	return self
end

function obj:hide()
	if self.capture then
		self.capture:stop()
	end
	self.capture = nil
	if self.cancel_hotkey then
		self.cancel_hotkey:delete()
	end
	self.canvas:hide()
end

function obj:toggleShow()
	if self:isShowing() then
		self:hide()
	else
		self:show()
	end
end

function obj:getKeys()
	local keys = {}
	for _, key in pairs(self.keys) do
		table.insert(keys, key)
	end
	return keys
end

function obj:getLastKey()
	local lastKeys = self:getKeys()
	return lastKeys[#lastKeys]
end

return obj
