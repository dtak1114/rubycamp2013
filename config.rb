# coding : utf-8

require "logger"

class Configure

	#logger
	LOG_FILE = File.dirname(__FILE__) + "/info.log"
	LOG_LEVEL = Logger::INFO

	#Player
	PLAYER_LIFE = 10

	#Enemy
	MAX_ENEMY_NUMBER = 100
end