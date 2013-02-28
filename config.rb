# coding : utf-8

require "logger"

class Configure

	#LIFE and STAGE condition
	GOAL_SCORE = 100
	

	#window
	WINDOW_HEIGHT = 600
	WINDOW_WIDTH = 800

	#Background
	LAND_IMG_X = 0
	LAND_IMG_Y = 350
	LAKE_IMG_X = 0
	LAKE_IMG_Y = 550
	SCORE_BACKGROUND_X = 20
	SCORE_BACKGROUND_Y = 40

	#Player
	PLAYER_LIFE = 10
	PLAYER_INIT_X = 400
	PLAYER_INIT_Y = 500
	PLAYER_MOVE_SPEED = 10

	#Enemy
	INIT_ENEMY_NUMBER = 100
	MAX_ENEMY_NUMBER = 100
	SEAFRONT_THRESHOLD = 300
	ENEMY_IMG_WIDTH = 32
	# ENEMY_MOVEMENT_WIDTH =

	#Bullet
	BULLET_SPEED = 6

	#Pants
	PANTS_SPEED = 8
	
	#logger
	LOG_FILE = File.dirname(__FILE__) + "log/info.log"
	LOG_LEVEL = Logger::INFO
end