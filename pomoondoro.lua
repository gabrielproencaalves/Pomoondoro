#!/bin/lua

gui = require "blibs.gui"  

bin = require "blibs.bin"

fileman = require "blibs.file"

audio_array = {"Dark","Dreams","Sunflower","Raindrops","Test Alarm"}

function alarm(value, __type)
	bin.loading(value, 32)
	bin.notify("TIME OUT!", string.format("%d%s HAVE PASSED!", value, __type or 's'))
	bin.play(fileman.readln("audio.conf"))
end

os.execute("clear")
while true do
		gui.title("POMOONDORO", 32, "-")
		gui.menu({"25 MIN ONLY",
				  " 5 MIN ONLY",
				  "BOTH (25 + 5)",
				  "BOTH (25 + 5) + REPLAY",
				  "SET AUDIO",
				  "EXIT"})
		print(gui.line(32, "-"))
		user_choice = bin.readnum("Insert a number: ")
		os.execute("clear")
		if user_choice then
			os.execute("clear")
			if user_choice == 1 then
				alarm(1500, 's')
				last_alarm = "only (25min)"
			elseif user_choice == 2 then
				alarm(300, 's')
				last_alarm = "only (5min)"
			elseif user_choice == 3 then
				alarm(1500, 's')
				alarm(300, 's')
				last_alarm = "both (25+5)"
			elseif user_choice == 4 then
				while true do
					alarm(1500, 's')
					alarm(300, 's')
					user_choice = string.lower(bin.readstr("Do you want to continue? [Y/N]"))
					if string.sub(user_choice, 1, 1) == "n" then
						break
					end
				end
				last_alarm = "loop (25+5)"
			elseif user_choice == 5 then
				gui.title("SET AUDIO", 32, "-")
				gui.menu(audio_array)
				print(gui.line(32, "-"))
				user_choice = bin.readnum("Insert a option [1-5]")
				if 1 <= user_choice and user_choice <= 4 then
					fileman.clear("audio.conf")
					fileman.write({"sounds/", audio_array[user_choice], ".mp3"}, "audio.conf")
				elseif user_choice == 5 then
					bin.play(fileman.readln("audio.conf"))
				else
					print("Invalid option! Try again...")
				end
			elseif user_choice == 6 then
				do return end
			else
				print("Invalid option! Try again...")
			end
		else
			print("Please, fill the data before proceed.")
			bin.sleep(2.5)
		end
		print(string.format("LA: %s %s", bin.show_time(), last_alarm))
end
