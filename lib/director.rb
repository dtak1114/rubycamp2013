# coding: utf-8

class Director
  def initialize
    @map = Map.new
    @score = Score.new

    @score.map = self

    # 海岸の画像の設定
    @land = Sprite.new(Configure::LAND_IMG_X, Configure::LAND_IMG_Y, Image.load("./images/beach.jpg"))
    # 湖の画像の設定
    @lake = Sprite.new(Configure::LAKE_IMG_X, Configure::LAKE_IMG_Y, Image.load("./images/lake.jpg"))
    # score_backgroundの設定
    @score_background = Sprite.new(Configure::SCORE_BACKGROUND_X, Configure::SCORE_BACKGROUND_Y, Image.new(80, 50, [150, 150, 110]))

    @damege_img = Image.load("./images/lake2.jpg")
    @death_img = Image.load("./images/lake3.jpg")

    @player_img = Image.load("./images/player.png")
    @player_img.setColorKey([0, 0, 0])
    @enemy_img = Image.load("./images/enemy.png")
    @enemy_img.setColorKey([0, 0, 0])
    @bullet_img = Image.load("./images/bullet.png")
    @bullet_img.setColorKey([0, 0, 0])
    @boss_img = Image.load("./images/tokio.png")
    @boss_img.setColorKey([0, 0, 0])

    @player = Player.new(Configure::PLAYER_INIT_X, Configure::PLAYER_INIT_Y, @player_img)

    @enemies = []
    @enemy_count = 0

    @bullets = []
    @boss = []
  
  end

  def add_enemies(bounds_y, num = 10)
    num.times do
      enemy  = Enemy.new(rand(Configure::WINDOW_WIDTH - @enemy_img.width), rand(bounds_y), @enemy_img)
      enemy.director = self
      @enemies << enemy
      @enemy_count += 1
    end
  end

  def add_boss
    @boss << Boss.new(350, 200, @boss_img)    
  end

  def check_collision
    #hit 
    if Sprite.check(@bullets, @enemies) 
      @score.point += 1
    end
  end

  def player_is_damege
    @lake.image = @damege_img
  end

  def player_is_dead
    @lake.image = @death_img
  end

  def play
    # refresh per frame 

    # background initialize
    @map.scroll
    @map.draw
    @land.draw
    @lake.draw
    @score_background.draw
    
    Sprite.update(@enemies)
    Sprite.draw(@enemies)
    Sprite.clean(@enemies)
     
    Sprite.update(@bullets)
    Sprite.draw(@bullets)
    Sprite.clean(@bullets)

    Sprite.update(@boss)
    Sprite.draw(@boss)
    Sprite.clean(@boss)

    Sprite.draw(@score)

    @player.update
    check_collision

    # background-change handle
    Enemy.arrive(@enemies)
    @score.next_stage(@map)
    
    @player.draw

    Bullet.fire(@bullets,@bullet_img,@player.x,@player.y,@player.angle)

    if @enemy_count < Configure::MAX_ENEMY_NUMBER
      add_enemies(50, 1) if ( rand(50) == 2 )
    end

    # Apper boss
    add_boss if @boss.empty?
  end

end
