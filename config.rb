# coding : utf-8

require "logger"

class Configure

	#KEY_CONFIG
	KEY_LEAN_LEFT= K_D
	KEY_LEAN_RIGHT = K_A
	# KEY_MOVE_LEFT = K_H
	# KEY_MOVE_RIGHT = K_L
	# KEY_SHOT = K_UP
	 KEY_SHOT = K_SPACE
	

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
	ENEMY_HP_1 = 1
	ENEMY_HP_2 = 2
	ENEMY_HP_3 = 3

	#BOSS
	BOSS_HP = 10

	#Bullet
	BULLET_SPEED = 6

	#Pants
	PANTS_SPEED = 8
	KEY_PANTS_SHOT = K_P
	PANTS_APPEAR_POINT = 30

	#Airstrike
	FIGHTER_SPEED = 20
	KEY_AIRSTRIKE = K_O
	
	#Stage
	CANGE_STAG_POINT_MIN = 10
	CANGE_STAG_POINT_HIGHE = 20


	#logger
	LOG_FILE = File.dirname(__FILE__) + "log/info.log"
	LOG_LEVEL = Logger::INFO
end
