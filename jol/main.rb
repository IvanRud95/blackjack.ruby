require_relative 'menu'
require_relative 'interface'
require_relative 'logic'
require_relative 'game_play'
require_relative 'card'
require_relative 'desk'
require_relative 'player'
require_relative 'user'


Menu.new(Interface.new, Logic.new).start

puts "Thank you for playing, bye"