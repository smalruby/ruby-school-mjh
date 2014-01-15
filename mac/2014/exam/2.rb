require 'smalruby'

c = Canvas.new
c.on(:start) do
  line(left: 0, top: 0, right: 100, bottom: 100, color: 'red')
end
