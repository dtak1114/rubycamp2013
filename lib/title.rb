#coding : utf-8

class Title
  def initialize
    @title_img = Image.load("images/title.png")
  end

  def play
  	#press 
    Scene.set_scene(:director) if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @title_img)
  end
end
