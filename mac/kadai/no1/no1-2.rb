require 'r2d'

include Math

w = window

n = 2
t = 1
s = Square.new(100, 100, 5, 'green')

update do
  rad = t * (PI / 180)
  s.x = w.w / 2 + 100 * cos(rad * n) * cos(rad)
  s.y = w.h / 2 + 100 * cos(rad * n) * sin(rad)
  t += 1
end

window :show
