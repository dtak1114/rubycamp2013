# coding: utf-8

class Enemy < Sprite
  attr_accessor :stopped, :director
  def initialize( x=0, y=0, image=nil) 
    super
    @seafront = Configure::SEAFRONT_THRESHOLD #海岸線を暫定的に決定　
    @count_update = 0 #updateを行った回数を数える   
    @move_v = rand(5)
    @direction = [1, -1][rand(2)]
  end

  def update()
    unless @stopped #移動の処理
      if self.x <= 0
        @direction = 1
      elsif self.x > Configure::WINDOW_WIDTH - Configure::ENEMY_IMG_WIDTH
        @direction = -1
      end
      @move_y = 1
      unless ((@count_update % 2 == 0) && self.y >= @seafront) #海岸線を超えたら遅くする  
        self.x += (@move_v * @direction)
        self.y += @move_y
      end
    end

    if self.y >= Window.height - self.image.height
      @vanished = true
    end
    @count_update += 1
  end

  def vanished?
    return @vanished
  end

  def hit(obj)
    @vanished = true unless @stopped
  end

  def self.arrive(enemies)
    enemies.each do |enemy|
      if enemy.y == 550
        puts life = Player.decrement_life
        # A background is changed in the amount of damages
        if  1 <= life && life <= 5
          enemy.director.player_is_damege        
        elsif life <= 0
          enemy.director.player_is_dead
          # ToDo: GameOver action
        end
      end      
    end
  end

  def self.add_enemies(directer, bounds_y, num = 10)
    num.times do
      enemy  = Enemy.new(rand(Configure::WINDOW_WIDTH - directer.enemy_img.width), rand(bounds_y), directer.enemy_img)
      enemy.director = self
      directer.enemies << enemy
      directer.enemy_count += 1
    end
  end

  def self.increment_enemeis(directer, enemy_count)
    if enemy_count < Configure::MAX_ENEMY_NUMBER
      add_enemies(directer, 50, 1) if ( rand(50) == 2 )
    end
  end
end
