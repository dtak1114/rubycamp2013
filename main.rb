# coding: utf-8

require 'dxruby'

require_relative 'configure/configure'
require_relative 'lib/director'
require_relative 'lib/player'
require_relative 'lib/enemy'
require_relative 'lib/map'
require_relative 'lib/map_obj'

Window.width  = 800
Window.height = 600

director = Director.new

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  director.play
end
