# coding: utf-8

require 'r2d'

window

N = 10
X = 30
Y = 400
W = 35
H = 50

Text.new(10, 10, 30, "数当てゲーム,0~#{N - 1}の数をあてよう！", 'green')
Text.new(10, 40, 25, '数字をクリック,Rキーで答えをリセット')

t = []
N.times do |i|
  t << Text.new(X + W * i, Y, H, i.to_s ,'white')
end

window :show
