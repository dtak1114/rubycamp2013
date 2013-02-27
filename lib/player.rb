# coding: utf-8

class Player < Sprite
  attr_accessor :director

  def update
    @dx = Input.x 
    @dy = Input.y
    self.x += @dx
    self.y += @dy
    self.x -= @dx unless (0..Window.width - self.image.width).include?(self.x)
    self.y -= @dy unless (0..Window.height - self.image.height).include?(self.y)
  end

  def shot(obj)
    if obj.is_a?(Enemy) && obj.stopped
      self.x -= @dx
      self.y -= @dy
    end
  end
end
