# coding: utf-8

require 'dxruby'
require 'logger'

require_relative 'config'

require_relative 'lib/director'
require_relative 'lib/player'
require_relative 'lib/enemy'

# Logger settings
begin
  log = Logger.new(Configure::LOG_FILE)
rescue => e
  log = Logger.new(STDOUT)
end

# Window height & width
Window.width  = 800
Window.height = 600

director = Director.new

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  director.play
end
