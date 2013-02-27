# coding: utf-8

class Player < Sprite
  attr_accessor :director
  # Hit-Point setting
  @@hp = 10

  def initialize(*)
    super
    @pushed = 2
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
    @pushed = @pushed += 1 if (Input.keyPush?(K_D) && @pushed < 3)#¶‚ÉŒX‚­
    @pushed = @pushed -= 1 if (Input.keyPush?(K_A) && @pushed > 1)#‰E‚ÉŒX‚­
    case @pushed
      when 1
# ‚±‚±‚Å‰æ‘œ‚ğØ‚è‘Ö‚¦‚é
          self.image = @player_l_img
#          self.angle = -45
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
