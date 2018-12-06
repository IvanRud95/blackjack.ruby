require_relative 'menu'
require_relative 'interface'
require_relative 'logic'
require_relative 'game_play'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'user'
require_relative 'bank'


Menu.new(Interface.new, Logic.new).start

interface.bye