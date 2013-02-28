# coding: utf-8

require_relative 'animesprite'

class Explode < AnimeSprite
  attr_accessor :animation_image,:flag,:anime_sprite_count,:anime_sprite_frame_count
  attr_reader :pattern_size

  @@explode_images = Image.load_tiles('./images/explode.bmp', 8, 2)
  @@explode_images.each do |e|
    e.setColorKey([0, 0, 0])
  end

  def initialize( x=0, y=0, image=nil) 
    super
    @pattern_size = 16
    @anime_sprite_animation_image = @@explode_images
    @flag = false
  end

  def update
    # @explode_frames = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] 
    # @explode.add_animation(:anime1, 3, @explode_frames) 
    super 
    if @anime_sprite_count  >= ((@pattern_size * @anime_sprite_frame_count) - 1)
      @flag = false
    end
    self.draw if @flag   
  end

end
