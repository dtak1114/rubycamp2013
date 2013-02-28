# coding: utf-8

class Airstrike < Sprite
	@@falcon_img = Image.load("./images/ff.png")
	@@falcon_img.setColorKey([0,0,0])

	def initialize(x=Window.width+200, y=0, image=@@falcon_img)
		super
		@flag = false
	end

	def update
		self.x -= Configure::FIGHTER_SPEED
	end

	def shot
		
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