local bin = {}

local print = print

function bin.clear_scrn()
	os.execute("clear")
end

function bin.notify(title, msg, delay)
	title = title or "Title"
	msg = msg or "Message"
	delay = delay or 5000
	os.execute(string.format("notify-send '%s' '%s' -t %d", title, msg, delay))
end

function bin.readnum(text)
	local insertion
	print(text or ">")
	--repeat
	status, insertion = pcall(io.read, "*n")
	io.read()
	if not status then return bin.readnum(text) end
	--until insertion
	return insertion
end

function bin.readstr(text)
	local insertion
	if text then print(text) end
	repeat
		status, insertion = pcall(io.read, "*l")
		io.read()
	until insertion
	return insertion
end

function bin.play(file)
	os.execute("mpg123 -q "..file)
end

function bin.sleep(value, __type)
	if not value then value = 5 end
	if not __type then __type = "s" end
	os.execute(string.format("sleep %s", tostring(value)..__type))
end

function bin.show_time()
	return os.date("%Y-%m-%d %X")
end

return bin
