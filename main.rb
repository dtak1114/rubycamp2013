# coding: utf-8

require 'dxruby'

require_relative 'lib/director'
require_relative 'lib/player'
require_relative 'lib/enemy'

Window.width  = 800
Window.height = 600

director = Director.new

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  director.play
end
