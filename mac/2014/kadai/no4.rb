require "smalruby"

Window.width = 800
l = 310
s = 0

bg = Canvas.new
sb = Canvas.new(height: 32)
w = Canvas.new(x: 780, y: 50, width: 10, height: 280)
r = Canvas.new(x: 40, y: 100, height: 120, width: 10)
b = Character.new(x: 50, y: l, costume: "ball6.png")

bg.on(:start) do
  box_fill(left: 0, top: l + 10,
           right: 800, bottom: 480,
           color: "yellowgreen")
end

sb.on(:start) do
  loop do
    fill(color: "black")
    draw_font(string: "SCORE: #{s}")
  end
end

w.on(:start) do
  fill(color: "burlywood")
end

r.on(:start) do
  fill(color: "white")
end

r.on(:key_down, K_UP) do
  self.y -= 5
end

r.on(:key_down, K_DOWN) do
  self.y += 5
end

r.on(:key_down, K_LEFT) do
  self.x -= 20
end

r.on(:key_down, K_RIGHT) do
  self.x += 5
end

b.on(:start) do
  bp = 30
  gp = 2
  py = bp

  loop do
    move(10)

    self.y -= py
    if self.y >= l
      py = bp
      self.y = l

      play(name: "piano_mi.wav")
    else
      py -= gp
    end

    if x <= 0
      vanish
      break
    end
  end
end

b.on(:hit, w) do
  turn
  self.x -= 30

  s += 1

  play(name: "piano_do.wav")
end

b.on(:hit, r) do
  turn
  self.x += 30

  play(name: "piano_so.wav")
end