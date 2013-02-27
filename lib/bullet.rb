# coding: utf-8

class Bullet < Sprite
  attr_accessor :stopped

  def initialize( x=0, y=0, image=nil) 
    super
  end

  def self.checker(bullets, img, player_loc_x, player_loc_y)
  	if Input.keyPush?(K_SPACE)
  		return bullets << new(player_loc_x, player_loc_y, img)
  	else
  		return bullets
  	end
  end

  def update
    self.y -= Configure::BULLET_SPEED unless @stopped
    if self.y <= 0 - self.image.height
      @stopped = true
    end
  end

  def vanished?
    return @vanished
  end

  def hit(obj)
    @vanished = true unless @stopped
  end
end
