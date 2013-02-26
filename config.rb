# coding : utf-8

require "logger"

class Configure

	#window
	WINDOW_HEIGHT = 600
	WINDOW_WIDTH = 800

	#Player
	PLAYER_LIFE = 10
	PLAYER_INIT_X = 400
	PLAYER_INIT_Y = 500

	#Enemy
	INIT_ENEMY_NUMBER = 1
	MAX_ENEMY_NUMBER = 10
	SEAFRONT_THRESHOLD = 300

	#logger
	LOG_FILE = File.dirname(__FILE__) + "log/info.log"
	LOG_LEVEL = Logger::INFO
end