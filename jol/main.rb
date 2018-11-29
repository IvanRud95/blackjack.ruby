require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'interface'
require_relative 'logic'
require_relative 'gameplay'

Game.new(Menu.new, Logic.new).start
