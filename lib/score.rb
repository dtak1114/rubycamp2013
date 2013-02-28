class Score

  attr_accessor :point, :map

  def initialize
    # score settings
    @point = 0 
    @font = Font.new(32)
  end

  def draw
    Window.drawFont(50, 50, @point.to_s, @font)
  end

  def next_stage(map)
  	# background_change handle
  	if 1 <= @point && @point < 5
  		map.change_stage2
  	elsif 5 <= @point
  		map.change_stage3
	end
  end

  def self.clear
	# Ending
  	Scene.set_scene(:ending)
  end
end