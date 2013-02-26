# coding: UTF-8

class Map
  attr_accessor :map_x, :map_y, :map_img, :view_port, :map_objects

  def initialize
    @scroll_speed = 1 # マップのスクロールスピード
    @map_img = Image.load("./images/sea.jpg") #海の背景画像の設定

    @map_x = @map_img.width - Window.width
    @map_y = 0
    update_view_port

    #海岸の画像の設定
    #@land.img = Sprite.new(0, 0, Image.load("./images/beach.jpg"))
  end

  def update_view_port
    if @map_img.width - @map_x >= Window.width
      @view_port = @map_img.slice(@map_x, @map_y, Window.width, Window.height)
      @view_port_rest = nil
    else
      @view_port = @map_img.slice(@map_x, @map_y, @map_img.width - @map_x, Window.height)
      @view_port_rest = @map_img.slice(0, @map_y, Window.width - (@map_img.width - @map_x), Window.height)
    end

    # 次のフレーム描画時に、現在のview_portオブジェクトを破棄する指定
    # これが無いと比較的大きめの画像オブジェクトがGCされるまで毎秒60回生成され続け、
    # パフォーマンスを圧迫する
    @view_port.delayed_dispose
    @view_port_rest.delayed_dispose if @view_port_rest
  end

  def scroll
    @map_x -= @scroll_speed
    @map_x = @map_img.width - @scroll_speed if @map_x < 0
    update_view_port
  end

  def draw
    Window.draw(0, 0, @view_port)
    if @view_port_rest
      Window.draw(@view_port.width, 0, @view_port_rest)
    end

    Sprite.update(@map_objects)
    Sprite.draw(@map_objects)
  end
end
