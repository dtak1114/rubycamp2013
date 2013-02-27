# coding: utf-8

require 'dxruby'
require 'logger'

require_relative 'config'
require_relative 'lib/director'
require_relative 'lib/player'
require_relative 'lib/enemy'
require_relative 'lib/scene'
require_relative 'lib/ending'
require_relative 'lib/title'
require_relative 'lib/bullet'
require_relative 'lib/map'
require_relative 'lib/map_obj'

title  = Title.new
ending = Ending.new
director = Director.new

Scene.add_scene(:title, title)
Scene.add_scene(:director, director)
Scene.add_scene(:ending, ending)

Scene.set_scene(:title)

# Logger settings
begin
  log = Logger.new(Configure::LOG_FILE)
rescue => e
  log = Logger.new(STDOUT)
end

# Window height & width
Window.width  = Configure::WINDOW_WIDTH
Window.height = Configure::WINDOW_HEIGHT

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
	Scene.play
end
