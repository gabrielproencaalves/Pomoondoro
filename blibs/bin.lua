local bin = {}

local print = print

function bin.clear_scrn()
	os.execute("clear")
end

function bin.notify(title, msg, delay)
	os.execute(string.format("notify-send '%s' '%s' -t %d", title or "Title", msg or "Message", delay or 5000))
end

function bin.read(text, param)
	local insertion
	while (not insertion) do
		print(text or "Insert: ")
		if param == "n" then insertion = io.read("number")
		elseif param == "s" then insertion = io.read("string") end
		io.read()
	end
	return insertion
end

function bin.readstr(text)
	local insertion
end

function bin.play(file)
	os.execute("mpg123 "..file)
end

function bin.show_time()
	print(os.date("%Y-%m-%d %X"))
end

return bin
