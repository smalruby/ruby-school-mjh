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

bomb = []
enemy = []
playing = true

on_key 'space' do
  if playing
    bomb << Rectangle.new(gun.x + 50, BOTTOM - 125, 10, 20, 'random')
  end
end

key_down 'left' do
  gun.x = (gun.x - 5) % w.w
end

key_down 'right' do
  gun.x = (gun.x + 5) % w.w
end

def hit_check(e, m)
  r = e.x + e.width > m.x && e.x < m.x + m.width &&
    e.y + e.height > m.y && e.y < m.y + m.height
  if r || m.y < 0 || m.y > (BOTTOM - 50)
    m.remove
  end
  return r
end

def gage_mgt(gage, hp, max_hp)
  gage.width = (max_hp.to_f * hp / max_hp).to_i
end

switch = true

update do
  if !playing
    next
  end
  if rand(30) == 0
    enemy << Image.new(ufo.x + 100, 120, 'enemy.png')
  end
  
  bomb.each do |b|
    b.y -= 6
    if hit_check(ufo, b)
      ufo_hp -= 1 
      gage_mgt(ufo_gage, ufo_hp, MAX_HP)
    end
  end
  
  enemy.each do |e|
    e.y += 6
    if hit_check(gun, e)
      my_hp -= 1 
      gage_mgt(my_gage, my_hp, MAX_HP)
    end
  end
  
  if switch
    ufo.x += 5
    if ufo.x > (w.w - 200)
      switch = false
    end
  else
    ufo.x -= 5
    if ufo.x <= 0
      switch = true
    end
  end
end

window :show
