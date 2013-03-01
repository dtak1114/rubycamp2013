# coding: utf-8
require 'pp'
class Director
  attr_reader :enemy_img, :boss_img
  attr_accessor :enemies, :enemy_count, :boss
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

    #画像を読み込んでおく

    @enemy_img = Image.load("./images/enemy.png")
    @enemy_img.setColorKey([0, 0, 0])
    @bullet_img = Image.load("./images/bullet.png")
    @bullet_img.setColorKey([0, 0, 0])
    @boss_img = Image.load("./images/tokio.png")
    @boss_img.setColorKey([0, 0, 0])

    @pants_img = Image.load("./images/pants.png")
    @pants_img.setColorKey([0, 0, 0])

    #BGM
    @bgm = Sound.new("sound/bgm.mid") 
    @bgm.play

    #SE
    @sound_fire = Sound.new("sound/explosion.wav")
    @sound_airstrike = Sound.new("sound/airstrike.wav")

    @player = Player.new(Configure::PLAYER_INIT_X, Configure::PLAYER_INIT_Y, @player_img)
    #Player's position at the beggining of the game

    #### Explode Initialize
    @explode = Explode.new()
    @explode_frames = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] 
    @explode.add_animation(:anime1, 3, @explode_frames) 
    ###
    @enemies = []
    @enemy_count = 0
    @bullets = []
    @boss = []
    @pants = []
    @fighters = []
    @bombs =[]
    @time = Time.new + 30
  end

  def check_collision
    #hit 
    if Sprite.check(@bullets, @enemies)
      #explode
      @explode.x = @enemies.last.x
      @explode.y = (@enemies.last.y - 50)
      @explode.start_animation(:anime1) 
      @explode.flag = true     
      #score
      @score.point += 1
    end
    if Sprite.check(@pants, @boss)
      @score.point += 1
    end
    if Sprite.check(@bombs, @enemies)
      #explode
     @explode.x = @enemies.last.x
      @explode.y = (@enemies.last.y - 50)
      @explode.start_animation(:anime1) 
      @explode.flag = true     
      #score
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
    [@map,@land,@lake,@score_background].each do |img|
        img.draw
    end
    
    [@player,@enemies,@bullets,@fighters,@boss,@pants,@bombs].each do |array| 
      Sprite.update(array)
      Sprite.draw(array)
      Sprite.clean(array)
    end

    check_collision

    Sprite.draw(@score)


    # background-change handle
    Enemy.arrive(@enemies)
    @score.next_stage(@map, @score.point)
    
    Bullet.fire(@bullets,@bullet_img,@player.x,@player.y,@player.angle,@sound_fire)
    Bomb.fire(@bombs,@fighters)
    Airstrike.fire(@fighters,@sound_airstrike)

    Enemy.increment_enemies(self, @enemies, @enemy_count, @score.point)

    #explode shot
    @explode.update

    Pants.fire(@pants, @pants_img, @player.x, @player.y, @player.angle, @score.point)

    # Apper boss
    Boss.add_boss(self, @score.point, @time)

 end
end
