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

require 'dino'

include Dino

bd = Board.new(Dino::TxRx.new)
lh = Components::Led.new(pin: 13, board: bd)
ll = Components::Led.new(pin: 12, board: bd)
 
def light(*ls)
  2.times do
    ls.each(&:on)
    sleep 0.1
    ls.each(&:off)
    sleep 0.1
  end
end

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
    light(lh)
  elsif ans < num
    a.content = "#{num}よりも小さい"
    a.color = 'blue'
    light(ll)
  else
    a.content = '正解！！！'
    a.color = 'green'
    light(ll, lh)
  end
end

key_down 'r' do
  num = -1
  ans = rand(N)
  a.content = ''
  N.times do |i|
    t[i].color = 'white'
  end
end

window :show
