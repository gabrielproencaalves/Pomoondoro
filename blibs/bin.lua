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
	print(text or ">")
	local status, insertion = pcall(io.read, "*n")
	io.read()
	if not status then return bin.readnum(text) end
	return insertion
end

function bin.readstr(text)
	print(text or ">")
	local status, insertion = pcall(io.read, "*l")
	io.read()
	if not status then return bin.readnum(text) end
	return insertion
end

function bin.play(file)
	os.execute("mpg123 -q "..file)
end

function bin.sleep(seconds)
	os.execute(string.format("sleep %fs", seconds))
end

function bin.show_time()
	return os.date("%Y-%m-%d %X")
end


function bin.loading(seconds, px)
	local list_char = {"[", string.rep("=", 0), string.rep(" ", px), "]"}
	local cpx = px
	for i = 1, px+1 do
		os.execute("clear")
		print(list_char[1]..list_char[2]..list_char[3]..list_char[4])		
		bin.sleep(seconds/px, "s")
		cpx = cpx - 1
		list_char[2] = string.rep("=", i)
		list_char[3] = string.rep(" ", cpx)
	end
end

return bin
