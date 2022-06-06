local fileman = {}

function fileman.clear(file)
	local opened = io.open(file, "w"):close()
end

function fileman.write(text, file, endln)
	local opened = io.open(file, "a")
	for index=1, #text do
		opened:write(text[index])
		opened:write(endln or "")
	end
	opened:close()
end

function fileman.readln(file)
	return io.open(file, "r"):read("*l")
end

return fileman
