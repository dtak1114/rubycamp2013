# coding: Shift_JIS

class Bullet < Sprite
  attr_accessor :stopped

  def update
    self.y -= 2 unless @stopped

    if self.y <= 0 - self.image.height
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
