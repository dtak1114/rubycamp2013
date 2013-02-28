# coding: utf-8

class Player < Sprite
  attr_accessor :angle
  # Hit-Point setting
  @@hp = Configure::PLAYER_LIFE

  def initialize(*)
    super
    @angle = 2
    @font = Font.new(32)
    @player_l_img = Image.load("./images/player_l.png")
    @player_l_img.setColorKey([0, 0, 0])
    @player_r_img = Image.load("./images/player_r.png")
    @player_r_img.setColorKey([0, 0, 0])
    @player_img = self.image
  end

  def update
    @dx = Input.x * Configure::PLAYER_MOVE_SPEED
    self.x += @dx
    self.x -= @dx unless (0..Window.width - self.image.width).include?(self.x)
    @angle = @angle += 1 if (Input.keyPush?(Configure::KEY_LEAN_LEFT) && @angle< 3)
    @angle= @angle-= 1 if (Input.keyPush?(Configure::KEY_LEAN_RIGHT) && @angle> 1)
    case @angle
      when 1
          self.image = @player_l_img
      when 2
          self.image = @player_img
      when 3
          self.image = @player_r_img
      end
  end

  def shot(obj)
    if obj.is_a?(Enemy) && obj.stopped
      self.x -= @dx
    end
  end

  def self.decrement_life
    @@hp -= 1
    return @@hp    
  end 
end
