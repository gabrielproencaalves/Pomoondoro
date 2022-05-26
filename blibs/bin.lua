local bin = {}

local print = print

function bin.clear_scrn()
	os.execute("clear")
end

function bin.notify(title, msg, delay)
	if title == nil then title = "Title" end
	if  msg  == nil then msg   ="Message"end
	if delay == nil then delay = 5000 end
	os.execute(string.format("notify-send '%s' '%s' -t %d", title, msg, delay))
end

function bin.readnum(text)
	local insertion
	if text == nil then text = "Text: " end
	while (insertion == nil) do
		insertion = nil
		print(text)
		insertion = io.read("number")
		io.read()
	end
	return insertion
end

return bin
