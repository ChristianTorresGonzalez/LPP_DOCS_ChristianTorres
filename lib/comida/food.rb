module Comida
	class Comida
		
		attr_reader :nombre, :proteina, :carbohidratos, :lipidos, :gei, :terreno
		
		def initialize(name, protein)
			@nombre = name
			@proteina = protein
		end
		
	end
end
