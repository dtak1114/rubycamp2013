# coding: utf-8

class Bullet < Sprite
  attr_accessor :stopped,:direction

  def initialize( x, y, image=nil, angle=0) 
    super
    case angle
    when 1 
      @direction = :left
    when 3 
      @direction = :right
    else 
      @direction = :straight
    end
  end

  def self.fire(bullets, img, player_loc_x, player_loc_y,player_angle)
  	if Input.keyPush?(Configure::KEY_SHOT)
      new_bullet = self.new(player_loc_x + 65, player_loc_y + 10, img, player_angle)
  		return bullets << new_bullet 
  	end
  end

  def update()
    unless @stopped
      case self.direction
      when :left
        #left
        self.angle = -45
        self.y -= Configure::BULLET_SPEED
        self.x -= Configure::BULLET_SPEED
      when :right
        #right
        self.angle = 45
        self.y -= Configure::BULLET_SPEED
        self.x += Configure::BULLET_SPEED
      else 
        #straight
        self.angle = 0
        self.y -= Configure::BULLET_SPEED
      end
    end 

    if self.y <= 0 - self.image.height
      @stopped = true
    end
  end

  def vanished?
    return @vanished
  end

  def shot(obj)
    @vanished = true unless @stopped
  end
end
