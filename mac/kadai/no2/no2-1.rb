# coding: utf-8

require 'r2d'

window

N = 10

Text.new(10, 10, 30, "数当てゲーム,0~#{N - 1}の数をあてよう！", 'green')
Text.new(10, 40, 25, '数字をクリック,Rキーで答えをリセット')

window :show
