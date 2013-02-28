#coding: utf-8

class Gameover
  attr_reader :closed

  def initialize
    @bg_img = Image.load("images/gameover.png")
  end

  def play
    @closed = true if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @bg_img)
  end
end