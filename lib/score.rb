class Score

  attr_accessor :point

  def initialize
    # score settings
    @point = 0 
    @font = Font.new(32)
  end

  def draw
    Window.drawFont(50, 50, @point.to_s, @font)
  end
end