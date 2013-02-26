# coding: Shift_JIS

class Bullet < Sprite
  attr_accessor :stopped

  def self.checker(bullets, img)
	if Input.keyPush?(K_SPACE)
		return bullets << new(500, 250, img)
	else
		return bullets
	end
  end

  def update
    self.y -= 7.5 unless @stopped

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
