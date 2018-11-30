require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'interface'
require_relative 'logic'
require_relative 'gameplay'
require_relative 'user'

Game.new(Interface.new, Logic.new).start
