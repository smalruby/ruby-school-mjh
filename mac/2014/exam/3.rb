require 'smalruby'

c = Canvas.new
c.on(:start) do
  box_fill(left: 0, top: 0, right: 100, bottom: 100, color: "blue")
end
