# coding: utf-8

require 'r2d'

w = window

MAX_HP = 500 
BOTTOM = 360

Rectangle.new(0, 0, w.w, BOTTOM, [46, 41, 48, 255])
Text.new(20, BOTTOM + 10, 20,
         'MISSION:UFOを撃墜せよ！「スペース」で弾を打つ「→」「←」で移動')

ufo_hp = MAX_HP
ufo_gage = Rectangle.new(10, 410, MAX_HP, 20, 'yellow')
Text.new(520, 410, 20, 'UFO HP')

my_hp = MAX_HP
my_gage = Rectangle.new(10, 450, MAX_HP, 20, 'red')
Text.new(520, 450, 20, 'YOU HP')

ufo = Image.new(50, 10, 'ufo.png')
ufo.width = 200
ufo.height = 150

gun = Image.new(300, BOTTOM - 115, 'gun.png')

window :show
