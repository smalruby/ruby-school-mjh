# coding: utf-8

require 'r2d'

w = window

MAX_HP = 500 
BOTTOM = 360

Rectangle.new(0, 0, w.w, BOTTOM, [46, 41, 48, 255])
Text.new(20, BOTTOM + 10, 20,
         'MISSION:UFOを撃墜せよ！「スペース」で弾を打つ「→」「←」で移動')

window :show
