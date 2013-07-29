require 'r2d'

win = window width: 640, height: 480
GAGE_LENGTH = 500 
UFO_HP = 500
MY_HP = 500 
BOTTOM = 360
bomb = []   #武器の弾
enemy = []  #UFOが落とすエーリアン
game_status = true  #true:play中　false:ゲーム終了

#ゲーム画面
background = Rectangle.new(0,0, 640, BOTTOM,[46,41, 48, 255])
about = Text.new(20, BOTTOM + 10, 20, "MISSION:UFOを撃墜せよ！　「p」：弾を打つ　「→」「←」で左右移動")
#ufo
ufo = Image.new(50,10,'ufo.png')
ufo.width = 200
ufo.height = 150
#武器
gun =Image.new(300,BOTTOM - 115,'gun.png')
#UFOの体力ゲージ
now_ufo_hp = UFO_HP
ufo_gage = Rectangle.new(10,410, GAGE_LENGTH, 20, "yellow")
ufo_title = Text.new(520, 410, 20, "UFO HP")
#自分の体力ゲージ
now_my_hp = MY_HP
my_gage = Rectangle.new(10, 450, GAGE_LENGTH, 20, "red")
my_title = Text.new(520, 450, 20, "YOU HP")

on_key 'p' do  #弾を打つ
  if game_status
      bomb.push(Rectangle.new(gun.x+50, BOTTOM - 125, 10,20, [rand(0..255), rand(0..255), rand(0..255), 255]))
  end
end

key_down 'left' do  #武器を左に移動
  gun.x = (gun.x - 5) % 640
end

key_down 'right' do  #武器を右に移動
  gun.x = (gun.x + 5) % 640
end

def hit_check e , m   #当たり判定 eはターゲット
  if r = e.x + e.width  > m.x && e.x < m.x + m.width &&
    e.y + e.height > m.y && e.y < m.y + m.height then
    m.remove
  end
  m.remove if m.y < 0 or m.y > (BOTTOM - 50)
  return r
end

def gage_mgt gage,hp,base_hp    #ゲージ管理
 gage.width = (GAGE_LENGTH * (hp.to_f/base_hp.to_f)).to_i
end

def final_message message,gage    #終了処理
  Rectangle.new(100, 100, 440, 150, "red")
  Text.new(150, 150, 50, message)
  gage.width = 0
  return false
end

switch = true
update do
   if game_status
       if now_ufo_hp >= 0
         if now_my_hp >= 0
               enemy.push(Image.new(ufo.x+100,120,'enemy.png'))  if rand(0..30) == 0  #敵投下
               
               bomb.each do |b|    #bombの動き
                 b.y -= 6
                 if hit_check(ufo,b)
                   now_ufo_hp -= 1 
                   gage_mgt(ufo_gage,now_ufo_hp,UFO_HP)
                 end
               end
               
               enemy.each do |e|    #enemyの動き
                 e.y += 6
                if hit_check(gun,e)
                   now_my_hp -= 1 
                   gage_mgt(my_gage,now_my_hp,MY_HP)
                end
               end
               
               if switch    #ufoの動き
                  ufo.x += 5
                  if ufo.x > (win.w - 200)
                    switch = false
                  end
                else
                  ufo.x -= 5
                  if ufo.x < 0
                    switch = true
                  end
               end  
          else
            game_status = final_message("GAME ORVER",my_gage)
          end
       else
         game_status = final_message("GAME CLEAR !!",ufo_gage)
       end
   end
end
window :show