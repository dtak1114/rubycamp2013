# coding: Shift_JIS

class MapObj < Sprite
  attr_accessor :map, :abs_x, :abs_y

  def update
    if @map.map_img.height - @map.map_y >= Window.height
      self.y = @abs_y - @map.map_y
    else
      if (@map.map_y .. @map.map_img.height).include?(@abs_y)
        self.y = @abs_y - @map.map_y
      else
        self.y = @abs_y + @map.view_port.height
      end
    end
    self.x = @abs_x - @map.map_x
  end

  def hit(obj)
    @vanished = true
  end

  def vanished?
    return @vanished
  end
end
