# coding: Shift_JIS

class Player < Sprite
  attr_accessor :director
  def initialize(*)
    super
    @pushed = 2
  end
  def update
    @dx = Input.x
    self.x += @dx
    self.x -= @dx unless (0..Window.width - self.image.width).include?(self.x)
    @pushed = @pushed += 1 if (Input.keyPush?(K_F) && @pushed < 3)
    @pushed = @pushed -= 1 if (Input.keyPush?(K_W) && @pushed > 1)
    case @pushed
      when 1
          self.angle = -45
      when 2
          self.angle = 0
      when 3
          self.angle = 45
      end
  end

  def shot(obj)
    if obj.is_a?(Enemy) && obj.stopped
      self.x -= @dx
    end
  end
end
