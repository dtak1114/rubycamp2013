class Score

  attr_accessor :score

  def initialize
    # score settings
    @score = 0 
    @font = Font.new(32)
  end

  def draw
    Window.drawFont(50, 50, @score.to_s, @font)
  end
end