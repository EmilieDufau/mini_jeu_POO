require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "| Bienvenu sur votre jeu 'ILS VEULENT TOUS MA POO' ! |"
puts "| Le but du jeu est d'être le dernier survivant !    |"  
puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"

#Initialisation du joueur
puts "> Start game : Entrez le nom de votre joueur"
user = HumanPlayer.new(gets.chomp)

#Initialisation des ennemis
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]
puts ""

#Le combat
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	puts user.show_state

	puts "--------------------------------------------------------" #separer les informations

	puts "Quelle action veux-tu effectuer ?"

	puts	"a - chercher une meilleure arme"
	puts	"s - chercher à se soigner" 

	puts "attaquer un joueur en vue :"
	puts	"0 - #{player1.show_state}"
	puts	"1 - #{player2.show_state}"

	print "faites votre choix parmis ces options : "
	user_tape = gets.chomp
	puts "" #separer les informations

		if user_tape == "a"
			puts user.search_weapon
		end
		if user_tape == "s"
			puts  user.search_health_pack
		end
		if user_tape == "0"
			puts user.attacks(player1)
		end
		if user_tape == "1"
			puts user.attacks(player2)
		end
	
	break if enemies.all? { |enemie| enemie.life_points <= 0 }

	#attaque des autre joueurs playeer 1 et 2
	puts "--------------------------------------------------------" #separer les informations
	puts "Les autres joueurs t'attaquent !"
	enemies.each do |enemie|
		enemie.attacks(user) if user.life_points > 0 && enemie.life_points > 0
	end

end

#Fin du jeu
puts "La partie est finie"