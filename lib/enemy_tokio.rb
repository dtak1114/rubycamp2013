# coding: utf-8

class Boss < Sprite
  attr_accessor :stopped, :director
  def initialize( x=0, y=0, image=nil) 
    super
    @count_update = 0 #updateを行った回数を数える   
    @move_x = rand(5) #敵のx方向の移動量
    @direction = [1, -1][rand(2)] #移動の方向
  end

  def update()
    unless @stopped 
      #移動の処理
      puts self.x = Configure::WINDOW_WIDTH * Math.sin((@count_update % 360) * Math::PI / 180) + Configure::WINDOW_WIDTH #八の字運動
      self.y = 50 * Math.sin((@count_update % 360) * Math::PI / 180) + 100
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
    @vanished = true unless @stopped
  end

end
