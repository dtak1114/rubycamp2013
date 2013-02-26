# coding: utf8

class Director
  def initialize
    @map = Sprite.new(0, 0, Image.load("./images/map.png"))

    @player_img = Image.load("./images/player.png")
    @player_img.setColorKey([0, 0, 0])
    @enemy_img = Image.load("./images/enemy.png")
    @enemy_img.setColorKey([0, 0, 0])

    @player = Player.new(400, 500, @player_img)
    @player.director = self

    @enemies = []
    add_enemies(300)
  end

  def add_enemies(bounds_y, num = 10)
    num.times do
      @enemies << Enemy.new(rand(800), rand(bounds_y), @enemy_img)
    end
  end

  def check_collision
    Sprite.check(@player, @enemies)
  end

  def play
    @map.draw

    Sprite.update(@enemies)
    Sprite.draw(@enemies)
    Sprite.clean(@enemies)

    @player.update
    check_collision

    @player.draw

    add_enemies(50, 1) if rand(50) == 2
  end
end
