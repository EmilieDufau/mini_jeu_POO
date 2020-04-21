require 'bundler'
require 'dotenv'
Bundler.require

Dotenv.load('.env')

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Voici l'état de chaque joueur :"

while player1.life_points > 0 && player2.life_points >0
	puts player1.show_state
	puts player2.show_state

	puts "==========================================" #separer les informations

	puts "Passons à la phase d'attaque :"
	puts player1.attacks(player2)
	puts player2.attacks(player1)

#la boucle s'arrête si l'un des joueurs n'as plus de points de vie
	if player2.life_points <= 0
		break 
	end

end



binding.pry
puts "end of file"