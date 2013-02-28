# coding: utf-8

require_relative 'animesprite'

class Explode < AnimeSprite
  attr_accessor :animation_image,:flag,:anime_sprite_count,:anime_sprite_frame_count
  attr_reader :anime_sprite_hash

  @@explode_images = Image.load_tiles('./images/explode.bmp', 8, 2)
  @@explode_images.each do |e|
    e.setColorKey([0, 0, 0])
  end

  def initialize( x=0, y=0, image=nil) 
    super
    @anime_sprite_animation_image = @@explode_images
    @flag = false
  end

  def update
    super
    # if @anime_sprite_count  >= ((@anime_sprite_hash[1].size * @explode.anime_sprite_frame_count) - 1)
    #   @explode.flag = false
    # end
    # @explode.draw if @explode.flag
  end

  def self.fire(x,y)
    new_bullet = Bullet.new(player_loc_x + 14, player_loc_y + 6, img, player_angle)
		return bullets << new_bullet 
  end

  def vanished?
    return @vanished
  end

  def hit(obj)
    @vanished = true unless @stopped
  end
end
