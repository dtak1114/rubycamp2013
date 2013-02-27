# coding: utf-8

class MapObj < Sprite
  attr_accessor :map, :abs_x, :abs_y

  def update
    if @map.map_img.width - @map.map_x >= Window.width
      self.x = @abs_x - @map.map_x
    else
      if (@map.map_x .. @map.map_img.width).include?(@abs_x)
        self.x = @abs_x - @map.map_x
      else
        self.x = @abs_x + @map.view_port.width
      end
    end
    self.y = @abs_y - @map.map_y
  end

  def hit(obj)
    @vanished = true
  end

  def vanished?
    return @vanished
  end
end
