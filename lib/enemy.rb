# coding: utf-8

class Enemy < Sprite
  attr_accessor :stopped, :director
  def initialize( x=0, y=0, image=nil) 
    super
    @seafront = Configure::SEAFRONT_THRESHOLD #海岸線を暫定的に決定　
    @count_update = 0 #updateを行った回数を数える   
    @move_v = rand(10) - 5
  end

  def update()
    unless @stopped #移動の処理
      
      #移動
      @move_v *= -1 if (self.x <= 0 || self.x > Configure::WINDOW_WIDTH - Configure::ENEMY_IMG_WIDTH)

      self.x += @move_v
      self.y += 1

      if (@count_update % 2 == 0 && self.y >= @seafront) #海岸線を超えたら遅くする  
        self.y -= 1   
        self.x -= @move_v if (self.x <= 0 || self.x > Configure::WINDOW_WIDTH - Configure::ENEMY_IMG_WIDTH)
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
          #ToDo: GameOver action
        end
      end      
    end
  end

end
