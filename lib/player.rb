# coding: utf-8

class Player < Sprite
  attr_accessor :director
  # Hit-Point setting
  @@hp = 10

  def initialize(*)
    super
    @pushed = 2
    @font = Font.new(32)
  end
  def update
    @dx = Input.x * Configure::PLAYER_MOVE_SPEED
    self.x += @dx
    self.x -= @dx unless (0..Window.width - self.image.width).include?(self.x)
    @pushed = @pushed += 1 if (Input.keyPush?(K_D) && @pushed < 3)#¶‚ÉŒX‚­
    @pushed = @pushed -= 1 if (Input.keyPush?(K_A) && @pushed > 1)#‰E‚ÉŒX‚­
    case @pushed
      when 1
          self.angle = -45
      when 2
          self.angle = 0
      when
          self.angle = 45
      end
  end

  def shot(obj)
    if obj.is_a?(Enemy) && obj.stopped
      self.x -= @dx
    end
  end
=begin
  def self.get_life
    return @@hp
  end
=end
  def self.decrement_life
    @@hp -= 1
    return @@hp    
  end 
end
