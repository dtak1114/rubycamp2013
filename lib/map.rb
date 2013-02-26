# coding: UTF-8

class Map
  attr_accessor :map_x, :map_y, :map_img, :view_port, :map_objects

  def initialize
    @scroll_speed = 1 # マップのスクロールスピード
    @map_img = Image.load("./images/sea.jpg")
    @map_x = 0
    @map_y = @map_img.height - Window.height
    update_view_port
  end

  def update_view_port
    if @map_img.height - @map_y >= Window.height
      @view_port = @map_img.slice(@map_x, @map_y, Window.width, Window.height)
      @view_port_rest = nil
    else
      @view_port = @map_img.slice(@map_x, @map_y, Window.width, @map_img.height - @map_y)
      @view_port_rest = @map_img.slice(@map_x, 0, Window.width, Window.height - (@map_img.height - @map_y))
    end

    # 次のフレーム描画時に、現在のview_portオブジェクトを破棄する指定
    # これが無いと比較的大きめの画像オブジェクトがGCされるまで毎秒60回生成され続け、
    # パフォーマンスを圧迫する
    @view_port.delayed_dispose
    @view_port_rest.delayed_dispose if @view_port_rest
  end

  def scroll
    @map_y -= @scroll_speed
    @map_y = @map_img.height - @scroll_speed if @map_y < 0
    update_view_port
  end

  def draw
    Window.draw(0, 0, @view_port)
    if @view_port_rest
      Window.draw(0, @view_port.height, @view_port_rest)
    end

    Sprite.update(@map_objects)
    Sprite.draw(@map_objects)
  end
end
