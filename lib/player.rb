class Player

	#un joueur possède deux attributs
	attr_accessor :name, :life_points

	def initialize (name)
		@name = name
		@life_points = 10
	end

#Présentation d'un joueur
	def show_state
		return "#{@name} a #{@life_points} points de vie"
	end

#Subir une attaque
	def gets_damage (damage_received)
		@life_points = @life_points - damage_received
		if @life_points <= 0
			return "Le joueur #{@name} a été tué !"
		end
	end

#Methode attaque 1 joueur sur un autre
	def attacks (player)
		puts "#{@name} attaque #{player.name}"

		damage_received = compute_damage 
		puts "et lui inflige #{damage_received} points de dommages"
		player.gets_damage(damage_received) #Renvoi les points des joueurs après une attaque
	end

	def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player
	attr_accessor :weapon_level 

	def initialize(name)
		super(name) #fait appel aux initialize de la classe Player
    @life_points = 100
    @weapon_level = 1
  end

  #Présentation d'un joueur + arme
	def show_state
		return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
  	new_weapon_level = rand(1..6)
  	puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

  	if new_weapon_level > @weapon_level
  		@weapon_level = new_weapon_level
  		puts  "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  	else
  		puts "La loose... elle n'est pas mieux que ton arme actuelle..."
  	end
  end

  def search_health_pack
  	health_pack = rand(1..6)
  	if health_pack == 1
  		puts  "Tu n'as rien trouvé... "
  	end
  	if health_pack.between?(2, 5)
  		@life_points < 100
  		@life_points = @life_points + 50
  		puts  "Bravo, tu as trouvé un pack de +50 points de vie !"
  	end
  	if health_pack == 6
  		@life_points < 100
  		@life_points = @life_points + 80
  		puts  "Waow, tu as trouvé un pack de +80 points de vie !"
  	end
  end

end