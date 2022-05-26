#!/bin/lua
gui = require "blibs.gui"
bin = require "blibs.bin"
audio_array = {'Dark','Dreams','Sunflower','Raindrops','Test Alarm'}


bin.clear_scrn()
gui.title("POMOONDORO", 30, "-")
gui.menu({'25 MIN ONLY',
          '5 MIN ONLY',
          'BOTH (25 + 5)',
          'BOTH (25 + 5) + REPLAY',
          'SET ALARM',
          'EXIT'})
print(gui.line(32, '-'))
num = bin.readnum("Insira um número: ")
bin.teste
