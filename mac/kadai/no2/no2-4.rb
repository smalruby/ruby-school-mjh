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

num = -1
ans = rand(N)
a = Text.new(25, 200, 75, '')

key_down 'mouse_left' do
  x = mouse_x
  y = mouse_y

  N.times do |i|
    mx = W * (i + 1)
    if mx < x && x < mx + X && Y < y && y < Y + H
      num = i
      break
    end
  end

  if num == -1
    next
  end

  N.times do |i|
    if i == num
      t[i].color = 'red'
    else
      t[i].color = 'white'
    end
  end

  if ans > num
    a.content = "#{num}よりも大きい"
    a.color = 'yellow'
  elsif ans < num
    a.content = "#{num}よりも小さい"
    a.color = 'blue'
  else
    a.content = '正解！！！'
    a.color = 'green'
  end
end


window :show
