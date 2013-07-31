require 'r2d'

include Math

w = window

n = 2
t = 1
s = Square.new(100, 100, 5, 'green')
ten = []

n2 = 10
s2 = Square.new(100, 100, 5, 'purple')
ten2 = []

update do
  rad = t * (PI / 180)
  s.x = w.w / 2 + 100 * cos(rad * n) * cos(rad)
  s.y = w.h / 2 + 100 * cos(rad * n) * sin(rad)
  ten << Square.new(s.x, s.y, 2, 'yellow')
  if ten.length > 180
    ten.shift.remove
  end
  t += 1

  s2.x = w.w / 2 + 100 * cos(rad * n2) * cos(rad)
  s2.y = w.h / 2 + 100 * cos(rad * n2) * sin(rad)
  ten2 << Square.new(s2.x, s2.y, 2, 'random')
  if ten2.length > 180
    ten2.shift.remove
  end
end

window :show
