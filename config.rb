# coding : utf-8

require "logger"

class Configure

	#window
	WINDOW_HEIGHT = 600
	WINDOW_WIDTH = 800

	#Background
	LAND_IMG_X = 0
	LAND_IMG_Y = 350

	#Player
	PLAYER_LIFE = 10
	PLAYER_INIT_X = 400
	PLAYER_INIT_Y = 500

	#Enemy
	INIT_ENEMY_NUMBER = 1
	MAX_ENEMY_NUMBER = 10
	SEAFRONT_THRESHOLD = 300

	#Bullet
	BULLET_POP_X = 100
	BULLET_POP_Y = 200
	
	#logger
	LOG_FILE = File.dirname(__FILE__) + "log/info.log"
	LOG_LEVEL = Logger::INFO
end