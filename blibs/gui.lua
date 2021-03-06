local gui = {}

local print = print

function gui.line(width, _char)------------line()
	if width == nil then width = 10 end
	if _char == nil then _char = "=" end
	
	local _line = ""
	for i = 1,width,1 do
		_line = _line.._char
	end
	return _line
end

function gui.title(text, width, _char)-----title()
	if width < #text then
		width = (width + (#text-width))+2
	end
	print(gui.line(width, _char))
	text = string.rep(" ", ((width-#text)//2))..text
	print(text)
	print(gui.line(width, _char))
	
end

function gui.menu(list)-------------------menu()
	for c, i in pairs(list) do
		print(string.format("%d. %s", c, i))
	end
end

return gui
