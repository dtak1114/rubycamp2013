# coding: utf-8

class Enemy < Sprite
  attr_accessor :stopped

  @seafront = 400 #海岸線を暫定的に決定　
  @i = 0 #updateを行った回数を数える   
    
  end
  def update
    self.y += 1 unless @stopped

    self.y -= 1 if i%2 == 0 && !@stopped #海岸線を超えたら遅くする

    if self.y >= Window.height - self.image.height
      @stopped = true
    end

    i += 1
  end

  def vanished?
    return @vanished
  end

　
  def hit(obj)
    @vanished = true unless @stopped
  end
end
