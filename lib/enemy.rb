# coding: utf-8

class Enemy < Sprite
  attr_accessor :stopped

  def update
    self.y += 1 unless @stopped

    if self.y >= Window.height - self.image.height
      @stopped = true
    end
  end

  def vanished?
    return @vanished
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    @vanished = true unless @stopped
  end
end
