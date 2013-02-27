class Explode < Sprite
  @@images = Image.loadToArray('images/explode2.bmp', 8, 2)
  @@images.each do |i|
  	i.setColorKey([0, 0, 0])
  end

	# def initialize( x=0, y=0, image=nil) 
	# 	super	
	# end

	# def update
			
	# end	

	# def vanished?
	# 	return @vanished		
	# end

	# def hit(obj)
 #    @vanished = true unless @stopped
 #  end

  def self.play(x,y)
  	@@images.each { |i| 
  		Window.draw(x,y,i)
  	 }
  end

end