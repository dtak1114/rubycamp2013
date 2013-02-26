# coding: utf-8

class Director
  def initialize
    @map = Map.new

    #海岸の画像の設定
    @land_img = Sprite.new(0, 350, Image.load("./images/beach.jpg"))

    @player_img = Image.load("./images/player.png")
    @player_img.setColorKey([0, 0, 0])
    @enemy_img = Image.load("./images/enemy.png")
    @enemy_img.setColorKey([0, 0, 0])

    @player = Player.new(Configure::PLAYER_INIT_X, Configure::PLAYER_INIT_Y, @player_img)
    @player.director = self

    @enemies = []
    @enemy_count = 0

    # add_enemies(300, Configure::INIT_ENEMY_NUMBER)
  end

  def add_enemies(bounds_y, num = 10)
    num.times do
      @enemies << Enemy.new(rand(Configure::WINDOW_WIDTH), rand(bounds_y), @enemy_img)
      @enemy_count += 1
    end
  end

  def check_collision
    Sprite.check(@player, @enemies)
  end

  def play
    @map.scroll
    @map.draw
    @land_img.draw
    Sprite.update(@enemies)
    Sprite.draw(@enemies)
    Sprite.clean(@enemies)

    @player.update
    check_collision

    @player.draw

    if @enemy_count < Configure::MAX_ENEMY_NUMBER
      add_enemies(50, 1) if ( rand(50) == 2 )
    end
  end

end
