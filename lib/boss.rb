# coding: utf-8

class Boss < Sprite
  @@tokio_d_img = Image.load("./images/tokio_d.png")
  @@tokio_d_img.setColorKey([0, 0, 0])

  attr_accessor :stopped, :director
  def initialize( x=0, y=0, image=nil) 
    super
    @hp = Configure::BOSS_HP
    @count_update = 0 #updateを行った回数を数える   
    @move_x = rand(5) #敵のx方向の移動量
    @direction = [1, -1][rand(2)] #移動の方向
    @hit_sound = Sound.new("sound/hit.wav")
  end

  def update()
    unless @stopped 
      #移動の処理
      self.x = (Configure::WINDOW_WIDTH / 3) * Math.sin((@count_update % 360) * Math::PI / 180) + (Configure::WINDOW_WIDTH / 2) - 60 #八の字運動
      self.y = 50 * Math.sin((@count_update % 360) * Math::PI / 180 * 2) + 100
    end

    if self.y >= Window.height - self.image.height
      @vanished = true
    end
    @count_update += 1
  end

  def vanished?
    return @vanished
  end

  def hit(obj)
    @hit_sound.play
    @hp -= 1
    if @hp < (Configure::BOSS_HP / 3)
      self.image = @@tokio_d_img
    end

    if @hp.zero? && !@stopped
      @vanished = true 
      Score.clear
    end
  end

  def self.add_boss(directer, score_point,  time)
    if time <= Time.new && directer.boss.empty?
        directer.boss << self.new(350, 200, directer.boss_img)
        return directer.boss
    end
  end
end
