#!/bin/lua
bin.clear_scrn()

--REQUIREMENTS--
--    lua     --
--   alsa     --
--  alsa-lib  --
--   mpg123   --

gui = require "blibs.gui"
bin = require "blibs.bin"
audio_array = {'Dark','Dreams','Sunflower','Raindrops','Test Alarm'}

bin.show_time()
gui.title("POMOONDORO", 30, "-")
gui.menu({'25 MIN ONLY',
          '5 MIN ONLY',
          'BOTH (25 + 5)',
          'BOTH (25 + 5) + REPLAY',
          'SET ALARM',
          'EXIT'})
print(gui.line(32, '-'))
num = bin.readnum("Insira um número: ", "n")
bin.notify("TAREFA CONCLUÍDA!", "O app foi executado com êxito!", 5000)

