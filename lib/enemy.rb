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

  # ���̃I�u�W�F�N�g����Փ˂��ꂽ�ۂɌĂ΂�郁�\�b�h
  def hit(obj)
    @vanished = true unless @stopped
  end
end
