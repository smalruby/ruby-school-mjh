# -*- coding: utf-8 -*-
require 'smalruby'

c = Canvas.new
c.on(:start) do
  draw_font(x: 0, y: 0, string: "こんにちは")
end
