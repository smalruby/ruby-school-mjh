# coding: utf-8

require 'r2d'
win = window width: 640, height: 480
PI = 3.1415
ten = []

n = 2
t = 1 
obj = Rectangle.new(100,100, 10, 10, "yellow")
update do
 rad= t * (PI / 180)
 obj.x = (win.w/2) + 100*Math.cos(rad * n) * Math.cos(rad)
 obj.y = (win.h/2) + 100*Math.cos(rad * n) * Math.sin(rad)
 ten.push(Rectangle.new(obj.x,obj.y, 1, 1, "blue"))
 t += 1
end
 Text.new(150,400, 50,  "HELLO WORLD!!")

window :show
