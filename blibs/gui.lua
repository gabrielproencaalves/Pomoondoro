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
	for i =1, (width-#text)/2 do
		text = " "..text
	end
	print(text)
	print(gui.line(width, _char))
	
end

function gui.menu(lista)-------------------menu()
	for c, i in pairs(lista) do
		print(string.format("%d. %s", c, i))
	end
end

return gui
