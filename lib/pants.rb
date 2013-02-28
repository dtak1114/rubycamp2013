# coding: utf-8

class Pants < Sprite
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

  def self.fire(pants, img, player_loc_x, player_loc_y,player_angle, score_point)
  	if Input.keyPush?(K_P) && Configure::PANTS_APPEAR_POINT <= score_point
      new_pants = Pants.new(player_loc_x + 14, player_loc_y + 6, img, player_angle)
  		return pants << new_pants
  	end
  end

  def update()
    unless @stopped
      case self.direction
      when :left
        #left
        self.angle = -45
        self.y -= Configure::PANTS_SPEED
        self.x -= Configure::PANTS_SPEED
      when :right
        #right
        self.angle = 45
        self.y -= Configure::PANTS_SPEED
        self.x += Configure::PANTS_SPEED
      else 
        #straight
        self.angle = 0
        self.y -= Configure::PANTS_SPEED
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
