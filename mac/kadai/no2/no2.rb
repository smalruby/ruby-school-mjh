require 'r2d'

window width: 640, height: 480

title = Text.new(10, 10, 30, "数当てゲーム,0~9の数をあてよう！")
explain = Text.new(30, 40, 30, "Rを押したら答えをリセット")
answer = Text.new(100, 200, 75, "", 'red')

t = []
10.times do|i|
	t.push(Text.new(30 + 35*i, 400, 50, "#{i}" ,'white'))
end

num = 0
ans = rand(10)

key_down 'mouse_left' do
	x = mouse_x
	y = mouse_y

	10.times do |i|
		m_x = 35 * (i+1)
		if (m_x<x && x<m_x+30) && (400<y && y<440)
			num = i
			answer.content = "#{num}よりも大きい" if ans > num
			answer.content = "#{num}よりも小さい" if ans < num
			answer.content = "正解は#{ans}" if ans == num
			t[i].color = 'red'
		else
			t[i].color = 'white'
		end
	end
end

key_down 'r' do
	ans = rand(10)
end

window :show
