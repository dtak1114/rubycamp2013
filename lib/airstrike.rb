# coding: utf-8

class Airstrike < Sprite
	@@falcon_img = Image.load("./images/ff.png")
	@@falcon_img.setColorKey([0,0,0])
	@@bomb_img = Image.load("images/bomb1.jpg")
	@@bomb_img.setColorKey([255,255,255])
	def initialize(x=Window.width+200, y=0, image=@@falcon_img)
		super
		@flag = false
	end

	def update
		self.x -= Configure::FIGHTER_SPEED
	end

	def self.fire(fighters)
		if Input.keyPush?(Configure::KEY_AIRSTRIKE)
      new_fighter = Airstrike.new()
  		return fighters << new_fighter 
		end
	end

	def vanished?
		return @vanished	
	end
end

class Bomb < Airstrike

	def update
		self.y += Configure::BOMB_FALLDOWN_SPEED
		if self.y >= Window.height - self.image.height
      		@vanished = true
    	end
	end

	def self.fire(bombs,fighters)
		if Input.keyPush?(Configure::KEY_AIRSTRIKE)
			(Configure::AIRSTRIKE_BOMB_NUMBER).times do 
				bombs << Bomb.new(rand(Window.width),-300,@@bomb_img)	
			end
		end
	end

	def shot(obj)
    @vanished = true unless @stopped
	end

end