# coding: utf-8

class Enemy < Sprite
  attr_accessor :stopped
  def initialize( x=0, y=0, image=nil) 
    super
    @seafront = Configure::SEAFRONT_THRESHOLD #海岸線を暫定的に決定　
    @count_update = 0 #updateを行った回数を数える   
  end

  def update()
    unless @stopped
      self.y += 1 
      self.y -= 1 if (@count_update %2 == 0 && self.y >= @seafront) #海岸線を超えたら遅くする   
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
