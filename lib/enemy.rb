# coding: utf-8

class Enemy < Sprite
  attr_accessor :stopped
  def initialize( x=0, y=0, image=nil) 
    super
    @seafront = Configure::SEAFRONT_THRESHOLD #海岸線を暫定的に決定　
    @count_update = 0 #updateを行った回数を数える   
    @move_v = 0
  end

  def update()
    unless @stopped #移動の処理
      if @count_update % 60 == 0 #once in a second
        @move_v = rand(10) - 5  #移動速度の変化
      end
      #移動
      @move_v *= -1 if (self.x <= 0 || self.x > Configure::WINDOW_WIDTH - Configure::ENEMY_IMG_WIDTH)

      self.x += @move_v
      self.y += 1

      if (@count_update % 2 == 0 && self.y >= @seafront) #海岸線を超えたら遅くする  
        self.y -= 1   
        self.x -= @move_v if (self.x <= 0 || self.x > Configure::WINDOW_WIDTH - Configure::ENEMY_IMG_WIDTH)
      end
    end

    if self.y >= Window.height - self.image.height
      @stopped = true
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
