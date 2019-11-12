module Comida
	class Comida
		
		attr_reader :nombre, :proteina, :carbohidratos, :lipidos, :gei, :terreno
		
		def initialize(name, protein, carbo, lipido)
			@nombre = name
			@proteina = protein
			@carbohidratos = carbo
		end
		
	end
end
