# coding: utf-8

class Director
  def initialize
    @map = Map.new
    @score = Score.new

    #海岸の画像の設定
    @land = Sprite.new(Configure::LAND_IMG_X, Configure::LAND_IMG_Y, Image.load("./images/beach.jpg"))
    #湖の画像の設定
    @lake = Sprite.new(Configure::LAKE_IMG_X, Configure::LAKE_IMG_Y, Image.load("./images/lake.jpg"))

    @damege_img = Image.load("./images/lake2.jpg")
    @death_img = Image.load("./images/lake3.jpg")


    @player_img = Image.load("./images/player.png")
    @player_img.setColorKey([0, 0, 0])
    @enemy_img = Image.load("./images/enemy.png")
    @enemy_img.setColorKey([0, 0, 0])
    @bullet_img = Image.load("./images/bullet.png")
    @bullet_img.setColorKey([0, 0, 0])

    @player = Player.new(Configure::PLAYER_INIT_X, Configure::PLAYER_INIT_Y, @player_img)
    @player.director = self

    #####
    @explode = AnimeSprite.new(@player.x,@player.y)
    explode_images = Image.load_tiles('./images/explode.bmp', 8, 2)

    explode_images.each do |e|
      e.setColorKey([0, 0, 0])
    end

    @explode.animation_image = explode_images

    @explode_frames = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] 

    @explode.add_animation(:anime1, 5, @explode_frames) 
    @explode_flag = false
    ######

    @enemies = []
    @enemy_count = 0

    @bullets = []
  end

  def add_enemies(bounds_y, num = 10)
    num.times do
      enemy  = Enemy.new(rand(Configure::WINDOW_WIDTH - @enemy_img.width), rand(bounds_y), @enemy_img)
      enemy.director = self
      @enemies << enemy
      @enemy_count += 1
    end
  end

  def add_tokio(bounds_y, num = 10)
    num.times do
      tokio  = Boss.new(rand(Configure::WINDOW_WIDTH - @enemy_img.width), rand(bounds_y), @enemy_img)
      tokio.director = self
      @enemies << tokio
      @enemy_count += 1
    end
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
    #refresh per frame 

    #background initialize
    @map.scroll
    @map.draw
    @land.draw
    @lake.draw
    
    Sprite.update(@enemies)
    Sprite.draw(@enemies)
    Sprite.clean(@enemies)
     
    Sprite.update(@bullets)
    Sprite.draw(@bullets)
    Sprite.clean(@bullets)

    Sprite.draw(@score)

    @player.update
    check_collision

    Enemy.arrive(@enemies)

    @player.draw

    Bullet.fire(@bullets,@bullet_img,@player.x,@player.y,@player.angle)

    if Input.keyPush? K_B
      p "explode"
      @explode.start_animation(:anime1) 
      @explode_flag = true
    end

    @explode.update

    if @explode.anime_sprite_count  >= ((@explode_frames.size * @explode.anime_sprite_frame_count) - 1)
      @explode_flag = false
    end

    @explode.draw if @explode_flag


    #tokio pop condition....
    # add_tokio(50,1)

    if @enemy_count < Configure::MAX_ENEMY_NUMBER
      add_enemies(50, 1) if ( rand(50) == 2 )
    end

  end

end
