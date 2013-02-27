# coding: utf-8

class Bullet < Sprite
  attr_accessor :stopped,:direction

  def initialize( x=0, y=0, image=nil,angle=0) 
    super
    case angle
    when -45
      @direction = :left
    when 45
      @direction = :right
    else 
      @direction = :straight
    end
  end

  def self.fire(bullets, img, player_loc_x, player_loc_y,player_angle)
  	if Input.keyPush?(K_SPACE)
      new_bullet = Bullet.new(player_loc_x + 14, player_loc_y + 6, img, player_angle)
  		return bullets << new_bullet 
  	else
  		return bullets
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

  def hit(obj)
    @vanished = true unless @stopped
  end
end
