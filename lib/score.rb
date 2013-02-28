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

  def next_stage(map, point)
  	# background_change handle
  	if Configure::CHANGE_STAG_POINT_MIN <= @point && @point < Configure::CHANGE_STAG_POINT_HIGHE
  		map.change_stage2
   		Enemy.change_enemies_hp(point) 		
  	elsif Configure::CHANGE_STAG_POINT_HIGHE <= @point
  		map.change_stage3
  		Enemy.change_enemies_hp(point)
	end
  end

  def self.clear
	# Ending
  	Scene.set_scene(:ending)
  end
end